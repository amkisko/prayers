# frozen_string_literal: true

require "json"
require "fileutils"
require "minitest/autorun"
require "tmpdir"
require_relative "../../packages/security-audit/skills/security-audit/scripts/run_validation"

class SecurityAuditRunTest < Minitest::Test
  def setup_run
    Dir.mktmpdir do |root|
      target = File.join(root, "target")
      run = File.join(root, "run")
      FileUtils.mkdir_p([target, File.join(run, "agents/hunter/artifacts")])
      File.write(File.join(target, "app.rb"), "authorize!\nread_secret\n")
      File.write(File.join(run, "agents/hunter/artifacts/trace.txt"), "bounded evidence\n")
      File.write(File.join(run, "REPORT.md"), "# Security audit\n")
      write_json(run, "run-metadata.json", metadata)
      write_json(run, "coverage-ledger.json", ledger)
      write_json(run, "findings.json", findings)
      yield target, run
    end
  end

  def validator(target, run)
    SecurityAudit::RunValidator.new(target:, run_directory: run)
  end

  def test_accepts_a_complete_run_with_existing_owned_evidence
    setup_run { |target, run| assert_empty validator(target, run).errors }
  end

  def test_rejects_a_source_line_outside_the_file
    setup_run do |target, run|
      document = read_json(run, "findings.json")
      document["findings"][0]["location"]["line"] = 3
      write_json(run, "findings.json", document)

      assert_errors target, run, "line 3 does not exist"
    end
  end

  def test_rejects_an_artifact_owned_by_another_agent
    setup_run do |target, run|
      document = read_json(run, "findings.json")
      document["findings"][0]["artifact_paths"] = ["agents/critic/artifacts/trace.txt"]
      write_json(run, "findings.json", document)

      assert_errors target, run, "must belong to hunter"
    end
  end

  def test_rejects_a_symlinked_artifact
    setup_run do |target, run|
      path = File.join(run, "agents/hunter/artifacts/trace.txt")
      File.delete(path)
      File.symlink(File.join(target, "app.rb"), path)

      assert_errors target, run, "must not contain symlinks"
    end
  end

  def test_rejects_severity_on_a_finding_that_needs_validation
    setup_run do |target, run|
      document = read_json(run, "findings.json")
      finding = document["findings"][0]
      finding["verdict"] = "needs_validation"
      finding["blockers"] = ["No runnable boundary fixture"]
      finding["validation_plan"] = "Replay with two principals"
      write_json(run, "findings.json", document)

      assert_errors target, run, "severity is allowed only for confirmed findings"
    end
  end

  def test_rejects_complete_run_when_candidate_has_no_finding
    setup_run do |target, run|
      write_json(run, "findings.json", {"schema_version" => 1, "findings" => []})

      assert_errors target, run, "candidate fingerprints must equal finding fingerprints"
    end
  end

  def test_rejects_a_finding_validated_by_its_owner
    setup_run do |target, run|
      document = read_json(run, "findings.json")
      document["findings"][0]["validator"] = "hunter"
      write_json(run, "findings.json", document)

      assert_errors target, run, "validator must differ from owner"
    end
  end

  def test_rejects_evidence_on_a_planned_coverage_unit
    setup_run do |target, run|
      document = read_json(run, "coverage-ledger.json")
      document["units"][0]["status"] = "planned"
      document["units"][0]["finding_fingerprints"] = []
      write_json(run, "coverage-ledger.json", document)

      assert_errors target, run, "planned must not have owner, reviewed paths, or checks"
    end
  end

  def test_complete_run_rejects_unfinished_coverage
    setup_run do |target, run|
      document = read_json(run, "coverage-ledger.json")
      unit = document["units"][0]
      unit["status"] = "planned"
      unit.delete("owner")
      unit.delete("reviewed_paths")
      unit.delete("checks")
      unit["finding_fingerprints"] = []
      write_json(run, "coverage-ledger.json", document)
      write_json(run, "findings.json", {"schema_version" => 1, "findings" => []})

      assert_errors target, run, "complete run must not contain planned or blocked coverage"
    end
  end

  def test_complete_run_rejects_a_finding_that_still_needs_validation
    setup_run do |target, run|
      document = read_json(run, "findings.json")
      finding = document["findings"][0]
      finding["verdict"] = "needs_validation"
      finding.delete("severity")
      finding.delete("observed_minimum_result")
      finding.delete("smallest_fix")
      finding["blockers"] = ["No runnable boundary fixture"]
      finding["validation_plan"] = "Replay with two principals"
      write_json(run, "findings.json", document)

      assert_errors target, run, "complete run must not contain needs_validation findings"
    end
  end

  def test_incomplete_run_requires_a_reason
    setup_run do |target, run|
      document = read_json(run, "run-metadata.json")
      document["status"] = "incomplete"
      document.delete("incomplete_reason")
      write_json(run, "run-metadata.json", document)

      assert_errors target, run, "incomplete_reason"
    end
  end

  def test_complete_run_requires_reserved_validation_capacity
    setup_run do |target, run|
      document = read_json(run, "run-metadata.json")
      document["agent_budget"]["reserved_validation"] = 0
      write_json(run, "run-metadata.json", document)

      assert_errors target, run, "complete run must reserve at least one validation invocation"
    end
  end

  def test_malformed_agent_budget_is_reported_without_crashing
    setup_run do |target, run|
      document = read_json(run, "run-metadata.json")
      document["agent_budget"] = "three"
      write_json(run, "run-metadata.json", document)

      assert_errors target, run, "agent_budget must be an object"
    end
  end

  def test_accepts_a_source_symlink_that_stays_inside_the_target
    setup_run do |target, run|
      File.symlink(File.join(target, "app.rb"), File.join(target, "linked.rb"))
      documents = [read_json(run, "coverage-ledger.json"), read_json(run, "findings.json")]
      documents[0]["units"][0]["reviewed_paths"] = ["linked.rb"]
      documents[1]["findings"][0]["location"]["path"] = "linked.rb"
      documents[1]["findings"][0]["trace"].each { |step| step["path"] = "linked.rb" }
      write_json(run, "coverage-ledger.json", documents[0])
      write_json(run, "findings.json", documents[1])

      assert_empty validator(target, run).errors
    end
  end

  def test_rejects_a_source_symlink_that_escapes_the_target
    setup_run do |target, run|
      outside = File.join(File.dirname(target), "outside.rb")
      File.write(outside, "secret\n")
      File.symlink(outside, File.join(target, "linked.rb"))
      document = read_json(run, "findings.json")
      document["findings"][0]["location"] = {"path" => "linked.rb", "line" => 1}
      write_json(run, "findings.json", document)

      assert_errors target, run, "escapes its root"
    end
  end

  def test_rejects_unknown_fields_on_run_documents
    setup_run do |target, run|
      metadata = read_json(run, "run-metadata.json")
      metadata["extra_meta"] = "no"
      write_json(run, "run-metadata.json", metadata)

      assert_errors target, run, "unknown field extra_meta"
    end
  end

  def test_rejects_unknown_fields_on_findings
    setup_run do |target, run|
      document = read_json(run, "findings.json")
      document["findings"][0]["smuggled"] = "no"
      write_json(run, "findings.json", document)

      assert_errors target, run, "unknown field smuggled"
    end
  end

  def test_rejects_unknown_fields_on_coverage_units
    setup_run do |target, run|
      document = read_json(run, "coverage-ledger.json")
      document["units"][0]["extra"] = "no"
      write_json(run, "coverage-ledger.json", document)

      assert_errors target, run, "unknown field extra"
    end
  end

  def test_source_line_counts_are_cached_per_path
    setup_run do |target, run|
      verifier = SecurityAudit::PathVerifier.new(target, strict_links: false)
      location = {"path" => "app.rb", "line" => 1}

      assert_empty verifier.source_errors(location, "location")
      assert_empty verifier.source_errors(location, "location")
      assert_equal({"app.rb" => 2}, verifier.instance_variable_get(:@line_counts))
    end
  end

  def test_package_schemas_are_valid_json
    schema_pattern = File.expand_path(
      "../../packages/security-audit/skills/security-audit/references/schemas/*.json",
      __dir__
    )

    Dir.glob(schema_pattern).each { |path| assert_kind_of Hash, JSON.parse(File.read(path)), path }
    assert_equal 3, Dir.glob(schema_pattern).length
  end

  private

  def assert_errors(target, run, fragment)
    assert validator(target, run).errors.any? { |error| error.include?(fragment) },
      validator(target, run).errors.inspect
  end

  def metadata
    {
      "schema_version" => 1,
      "run_id" => "20261008-example",
      "source_ref" => "HEAD",
      "status" => "complete",
      "started_at" => "2026-10-08T07:00:00Z",
      "finished_at" => "2026-10-08T07:05:00Z",
      "agent_budget" => {
        "maximum_invocations" => 3,
        "used_invocations" => 3,
        "reserved_validation" => 1
      },
      "report_path" => "REPORT.md"
    }
  end

  def ledger
    {
      "schema_version" => 1,
      "units" => [{
        "id" => "http-object-authorization",
        "attack_class" => "http_identity",
        "status" => "candidate",
        "owner" => "hunter",
        "reviewed_paths" => ["app.rb"],
        "checks" => ["two-principal replay"],
        "finding_fingerprints" => [fingerprint],
        "unresolved" => []
      }]
    }
  end

  def findings
    {
      "schema_version" => 1,
      "findings" => [{
        "fingerprint" => fingerprint,
        "owner" => "hunter",
        "validator" => "critic",
        "title" => "Object lookup crosses the ownership boundary",
        "verdict" => "confirmed",
        "likelihood" => "high",
        "impact" => "high",
        "severity" => "high",
        "confidence" => "high",
        "location" => {"path" => "app.rb", "line" => 2},
        "lower_trust_principal" => "another signed-in tenant",
        "starting_capability" => "read its own record",
        "input_or_action" => "replace the record identifier",
        "intended_control" => "ownership-scoped lookup",
        "crossed_boundary" => "tenant ownership",
        "affected_principal_or_resource" => "another tenant's record",
        "trace" => [
          {"path" => "app.rb", "line" => 1, "role" => "entry"},
          {"path" => "app.rb", "line" => 2, "role" => "sink"}
        ],
        "conditions" => ["two principals and one foreign record"],
        "observed_minimum_result" => "foreign record contents returned",
        "smallest_fix" => "scope the lookup to the authenticated tenant",
        "artifact_paths" => ["agents/hunter/artifacts/trace.txt"]
      }]
    }
  end

  def fingerprint
    "sha256:#{'a' * 64}"
  end

  def read_json(run, name)
    JSON.parse(File.read(File.join(run, name)))
  end

  def write_json(run, name, value)
    File.write(File.join(run, name), JSON.pretty_generate(value))
  end
end
