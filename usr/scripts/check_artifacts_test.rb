# frozen_string_literal: true

require "json"
require "minitest/autorun"
require "open3"
require "stringio"
require "tmpdir"
require "fileutils"
require_relative "check_artifacts"

class CheckArtifactsTest < Minitest::Test
  ARTIFACT = "v1/artifacts/amkisko/example/1.0.0/amkisko-example-1.0.0.praypkg"

  def test_reports_missing_artifact_file
    Dir.mktmpdir do |directory|
      distribution_root = write_distribution(directory, artifact_body: nil)
      missing, untracked = find_artifact_problems(distribution_root, directory)
      assert_equal ["#{File.basename(distribution_root)}/#{ARTIFACT}"], missing
      assert_empty untracked
    end
  end

  def test_reports_untracked_artifact_file
    Dir.mktmpdir do |directory|
      distribution_root = write_distribution(directory)
      initialize_git_repository(directory)
      add_git_path(directory, File.join(File.basename(distribution_root), "v1", "packages"))
      missing, untracked = find_artifact_problems(distribution_root, directory)
      assert_empty missing
      assert_equal ["#{File.basename(distribution_root)}/#{ARTIFACT}"], untracked
    end
  end

  def test_accepts_tracked_artifact_file
    Dir.mktmpdir do |directory|
      distribution_root = write_distribution(directory)
      initialize_git_repository(directory)
      add_git_path(directory, File.basename(distribution_root))
      missing, untracked = find_artifact_problems(distribution_root, directory)
      assert_empty missing
      assert_empty untracked
    end
  end

  def test_cli_accepts_distribution_root_argument
    Dir.mktmpdir do |directory|
      distribution_root = write_distribution(directory)
      stdout, stderr, status = Open3.capture3("ruby", checker_script, distribution_root)
      assert_equal 0, status.exitstatus, stderr
      assert_equal "check-artifacts: ok\n", stdout
    end
  end

  def test_skips_version_without_artifact
    Dir.mktmpdir do |directory|
      distribution_root = File.join(directory, "prayers")
      catalog_directory = File.join(distribution_root, "v1", "packages", "amkisko")
      FileUtils.mkdir_p(catalog_directory)
      File.write(
        File.join(catalog_directory, "example.json"),
        JSON.generate(
          "name" => "amkisko/example",
          "versions" => [{ "version" => "1.0.0" }]
        )
      )
      missing, untracked = find_artifact_problems(distribution_root, directory)
      assert_empty missing
      assert_empty untracked
    end
  end

  def test_accepts_present_file_outside_git_work_tree
    Dir.mktmpdir do |directory|
      distribution_root = write_distribution(directory)
      missing, untracked = find_artifact_problems(distribution_root, directory)
      assert_empty missing
      assert_empty untracked
    end
  end

  def test_report_prints_missing_and_operator_hint
    stderr = StringIO.new
    stdout = StringIO.new
    status = report_artifact_problems(
      ["prayers/#{ARTIFACT}"],
      ["prayers/#{ARTIFACT}"],
      stdout: stdout,
      stderr: stderr
    )
    assert_equal 1, status
    assert_includes stderr.string, "missing: prayers/#{ARTIFACT}"
    assert_includes stderr.string, "untracked: prayers/#{ARTIFACT}"
    assert_includes stderr.string, "git add the listed .praypkg files"
    assert_empty stdout.string
  end

  def test_report_prints_ok_when_clean
    stderr = StringIO.new
    stdout = StringIO.new
    status = report_artifact_problems([], [], stdout: stdout, stderr: stderr)
    assert_equal 0, status
    assert_equal "check-artifacts: ok\n", stdout.string
    assert_empty stderr.string
  end

  def test_real_catalog_artifacts_are_present_and_tracked
    repository_root = File.expand_path("../..", __dir__)
    distribution_root = File.join(repository_root, "prayers")
    missing, untracked = find_artifact_problems(distribution_root, repository_root)
    assert_empty missing
    assert_empty untracked
  end

  def write_distribution(repository_root, artifact_body: "pkg")
    distribution_root = File.join(repository_root, "prayers")
    catalog_directory = File.join(distribution_root, "v1", "packages", "amkisko")
    FileUtils.mkdir_p(catalog_directory)
    if artifact_body
      artifact_path = File.join(distribution_root, ARTIFACT)
      FileUtils.mkdir_p(File.dirname(artifact_path))
      File.write(artifact_path, artifact_body)
    end
    File.write(
      File.join(catalog_directory, "example.json"),
      JSON.generate(
        "name" => "amkisko/example",
        "versions" => [{ "version" => "1.0.0", "artifact" => ARTIFACT }]
      )
    )
    distribution_root
  end

  def initialize_git_repository(directory)
    git(directory, "init")
  end

  def add_git_path(directory, relative_path)
    git(directory, "add", "--", relative_path)
  end

  def checker_script
    File.expand_path("check_artifacts.rb", __dir__)
  end

  def git(directory, *arguments)
    environment = ENV.to_h.reject { |key, _| %w[GIT_DIR GIT_WORK_TREE GIT_COMMON_DIR].include?(key) }
    stdout, stderr, status = Open3.capture3(environment, "git", "-C", directory, *arguments)
    return if status.success?

    raise "git #{arguments.join(' ')} failed: #{stdout}#{stderr}"
  end
end
