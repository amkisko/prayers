# frozen_string_literal: true

require "json"
require "minitest/autorun"
require "open3"
require "tmpdir"
require "fileutils"
require_relative "catalog_topics"

class CatalogTopicsTest < Minitest::Test
  def test_topics_from_summary_drop_function_words
    summary = "Repository documentation layout and headings — docs timestamp trees, usr workshop"
    assert_equal(
      %w[repository documentation layout headings docs],
      topics_from_summary(summary)
    )
  end

  def test_topics_from_summary_skip_publisher_and_digits
    summary = "Branch naming conventions — # amkisko/branch-naming 2026"
    assert_equal %w[branch naming conventions], topics_from_summary(summary)
  end

  def test_topics_from_summary_omit_what_only_that
    summary = "what the product does not do, only when that heading is open"
    topics = topics_from_summary(summary)
    refute_includes topics, "what"
    refute_includes topics, "only"
    refute_includes topics, "that"
    assert_equal %w[product heading open], topics
  end

  def test_rewrite_replaces_noisy_topics_from_summary
    payload = catalog_payload(
      summary: "Collaboration and durable context workflow — Collaboration workflow",
      topics: %w[what only that work they]
    )
    assert rewrite_catalog_payload(payload)
    assert_equal(
      %w[collaboration durable context workflow],
      payload.dig("versions", 0, "derived_metadata", "topics")
    )
  end

  def test_rewrite_is_idempotent_when_topics_already_match
    payload = catalog_payload(
      summary: "Finite state machines — named states and guarded transitions",
      topics: %w[finite state machines named states]
    )
    refute rewrite_catalog_payload(payload)
  end

  def test_rewrite_skips_version_without_summary
    payload = {
      "name" => "amkisko/example",
      "versions" => [{ "version" => "1.0.0", "derived_metadata" => { "topics" => %w[what] } }]
    }
    refute rewrite_catalog_payload(payload)
    assert_equal %w[what], payload.dig("versions", 0, "derived_metadata", "topics")
  end

  def test_rewrites_catalog_file_and_cli_reports_count
    Dir.mktmpdir do |directory|
      distribution_root = write_distribution(
        directory,
        topics: %w[what only that docs open],
        summary: "Repository documentation layout and headings — docs timestamp trees"
      )
      rewritten = rewrite_catalog_files(distribution_root)
      assert_equal 1, rewritten
      payload = JSON.parse(
        File.read(
          File.join(distribution_root, "v1", "packages", "amkisko", "example.json"),
          encoding: "UTF-8"
        )
      )
      assert_equal(
        %w[repository documentation layout headings docs],
        payload.dig("versions", 0, "derived_metadata", "topics")
      )

      stdout, stderr, status = Open3.capture3("ruby", rewriter_script, distribution_root)
      assert_equal 0, status.exitstatus, stderr
      assert_equal "catalog-topics: ok\n", stdout
    end
  end

  def test_live_catalog_omits_function_words_from_docs_conventions_3
    payload = JSON.parse(File.read(live_docs_conventions, encoding: "UTF-8"))
    version = payload.fetch("versions").find { |entry| entry["version"] == "3.0.0" }
    topics = version.dig("derived_metadata", "topics")
    %w[what only that this when they will].each do |word|
      refute_includes topics, word
    end
    assert_equal 5, topics.length
  end

  def catalog_payload(summary:, topics:)
    {
      "name" => "amkisko/example",
      "versions" => [
        {
          "version" => "1.0.0",
          "derived_metadata" => {
            "summary" => summary,
            "topics" => topics
          }
        }
      ]
    }
  end

  def write_distribution(repository_root, topics:, summary:)
    distribution_root = File.join(repository_root, "prayers")
    catalog_directory = File.join(distribution_root, "v1", "packages", "amkisko")
    FileUtils.mkdir_p(catalog_directory)
    File.write(
      File.join(catalog_directory, "example.json"),
      JSON.pretty_generate(catalog_payload(summary: summary, topics: topics)) + "\n",
      encoding: "UTF-8"
    )
    distribution_root
  end

  def rewriter_script
    File.expand_path("catalog_topics.rb", __dir__)
  end

  def live_docs_conventions
    File.expand_path("../../prayers/v1/packages/amkisko/docs-conventions.json", __dir__)
  end
end
