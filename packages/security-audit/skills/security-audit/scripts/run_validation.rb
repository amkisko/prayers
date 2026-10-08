# frozen_string_literal: true

require "json"
require "time"
require_relative "coverage_validation"
require_relative "finding_validation"
require_relative "object_shape"
require_relative "path_verifier"

module SecurityAudit
  class RunValidator
    MAXIMUM_JSON_BYTES = 5 * 1024 * 1024
    METADATA_KEYS = %w[schema_version run_id source_ref status started_at finished_at report_path
      incomplete_reason agent_budget].freeze
    BUDGET_KEYS = %w[maximum_invocations used_invocations reserved_validation].freeze

    def initialize(target:, run_directory:)
      @source_verifier = PathVerifier.new(target, strict_links: false)
      @run_verifier = PathVerifier.new(run_directory)
      @run_directory = run_directory
    end

    def errors
      return @errors if defined?(@errors)

      @errors = []
      metadata = read_json("run-metadata.json")
      coverage = CoverageValidation.new(read_json("coverage-ledger.json"), @source_verifier).validate
      findings = FindingValidation.new(
        read_json("findings.json"), @source_verifier, @run_verifier
      ).validate
      @errors.concat(coverage.errors).concat(findings.errors)
      validate_metadata(metadata)
      validate_cross_document(metadata, coverage.units, findings.findings)
      @errors
    end

    private

    def read_json(name)
      path_errors = @run_verifier.file_errors(name, name)
      unless path_errors.empty?
        @errors.concat(path_errors)
        return nil
      end
      path = File.join(@run_directory, name)
      if File.size(path) > MAXIMUM_JSON_BYTES
        @errors << "#{name} exceeds #{MAXIMUM_JSON_BYTES} bytes"
        return nil
      end
      JSON.parse(File.read(path, encoding: "UTF-8"))
    rescue JSON::ParserError => error
      @errors << "#{name} is invalid JSON: #{error.message}"
      nil
    end

    def validate_metadata(metadata)
      unless metadata.is_a?(Hash) && metadata["schema_version"] == 1
        @errors << "run-metadata.json schema_version must be 1"
        return
      end
      ObjectShape.reject_unknown_keys(metadata, METADATA_KEYS, "run-metadata.json", @errors)
      %w[run_id source_ref status started_at].each do |field|
        @errors << "run metadata #{field} must be a non-empty string" unless present?(metadata[field])
      end
      @errors << "run metadata status must be complete or incomplete" unless %w[complete incomplete].include?(metadata["status"])
      validate_time(metadata["started_at"], "started_at")
      validate_time(metadata["finished_at"], "finished_at") if metadata["status"] == "complete"
      validate_budget(metadata["agent_budget"])

      budget = metadata["agent_budget"]
      if metadata["status"] == "complete" && budget.is_a?(Hash) && budget["reserved_validation"].to_i < 1
        @errors << "complete run must reserve at least one validation invocation"
      end

      if metadata["status"] == "complete"
        @errors << "complete run needs report_path" unless present?(metadata["report_path"])
        @errors.concat(@run_verifier.file_errors(metadata["report_path"], "report_path")) if present?(metadata["report_path"])
      elsif !present?(metadata["incomplete_reason"])
        @errors << "incomplete run needs incomplete_reason"
      end
    end

    def validate_time(value, field)
      Time.iso8601(value)
    rescue ArgumentError, TypeError
      @errors << "run metadata #{field} must be ISO 8601"
    end

    def validate_budget(budget)
      unless budget.is_a?(Hash)
        @errors << "run metadata agent_budget must be an object"
        return
      end
      ObjectShape.reject_unknown_keys(budget, BUDGET_KEYS, "agent_budget", @errors)
      values = BUDGET_KEYS.to_h do |field|
        value = budget[field]
        @errors << "agent_budget #{field} must be a non-negative integer" unless value.is_a?(Integer) && value >= 0
        [field, value]
      end
      return unless values.values.all? { |value| value.is_a?(Integer) && value >= 0 }

      if values["used_invocations"] > values["maximum_invocations"]
        @errors << "used agent invocations exceed the maximum"
      end
      if values["reserved_validation"] > values["maximum_invocations"]
        @errors << "reserved validation invocations exceed the maximum"
      end
    end

    def validate_cross_document(metadata, units, findings)
      return unless metadata.is_a?(Hash)

      candidate_pairs = units.filter_map do |unit|
        next unless unit.is_a?(Hash) && unit["status"] == "candidate"
        Array(unit["finding_fingerprints"]).map { |fingerprint| [fingerprint, unit["owner"]] }
      end.flatten(1)
      finding_pairs = findings.filter_map do |finding|
        [finding["fingerprint"], finding["owner"]] if finding.is_a?(Hash)
      end
      return unless metadata["status"] == "complete"

      if candidate_pairs.sort != finding_pairs.sort
        @errors << "complete run candidate fingerprints must equal finding fingerprints and owners"
      end
      unfinished = units.any? do |unit|
        unit.is_a?(Hash) && %w[planned blocked].include?(unit["status"])
      end
      @errors << "complete run must not contain planned or blocked coverage" if unfinished
      needs_validation = findings.any? do |finding|
        finding.is_a?(Hash) && finding["verdict"] == "needs_validation"
      end
      @errors << "complete run must not contain needs_validation findings" if needs_validation
    end

    def present?(value)
      value.is_a?(String) && !value.empty?
    end
  end
end
