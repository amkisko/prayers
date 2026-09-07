#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "open3"
require "pathname"
require "set"

# Host git wrappers set GIT_DIR; strip it so checks see the target repository.
GIT_ENVIRONMENT_EXCLUSIONS = %w[GIT_DIR GIT_WORK_TREE GIT_COMMON_DIR].freeze

def git_environment
  ENV.to_h.reject { |key, _| GIT_ENVIRONMENT_EXCLUSIONS.include?(key) }
end

def catalog_artifact_paths(distribution_root)
  packages = File.join(distribution_root, "v1", "packages")
  Dir.glob(File.join(packages, "**", "*.json")).sort.flat_map do |catalog|
    payload = JSON.parse(File.read(catalog, encoding: "UTF-8"))
    versions = payload["versions"] || []
    versions.filter_map do |version|
      relative = version["artifact"]
      File.join(distribution_root, relative) unless relative.nil? || relative.empty?
    end
  end
end

def tracked_paths(repo_root)
  stdout, _stderr, status = Open3.capture3(
    git_environment,
    "git", "-C", repo_root.to_s, "rev-parse", "--is-inside-work-tree"
  )
  return nil unless status.success? && stdout.strip == "true"

  listed, stderr, status = Open3.capture3(
    git_environment,
    "git", "-C", repo_root.to_s, "ls-files", "-z"
  )
  raise "git ls-files failed: #{stderr}" unless status.success?

  listed.split("\0").reject(&:empty?).to_set
end

def display_path(artifact, repo_root)
  Pathname.new(artifact).relative_path_from(Pathname.new(repo_root)).to_s
rescue ArgumentError
  artifact.to_s
end

def find_artifact_problems(distribution_root, repo_root)
  missing = []
  untracked = []
  tracked = tracked_paths(repo_root)

  catalog_artifact_paths(distribution_root).each do |artifact|
    display = display_path(artifact, repo_root)
    unless File.file?(artifact)
      missing << display
      next
    end
    untracked << display if tracked && !tracked.include?(display)
  end

  [missing, untracked]
end

def report_artifact_problems(missing, untracked, stdout: $stdout, stderr: $stderr)
  if missing.empty? && untracked.empty?
    stdout.puts "check-artifacts: ok"
    return 0
  end

  missing.each { |path| stderr.puts "missing: #{path}" }
  untracked.each { |path| stderr.puts "untracked: #{path}" }
  stderr.puts "git add the listed .praypkg files, then rerun make check-artifacts; do not rerun make publish"
  1
end

def resolve_roots(arguments, script_directory: __dir__, working_directory: Dir.pwd)
  if arguments.empty?
    repo_root = File.expand_path("../..", script_directory)
    [File.join(repo_root, "prayers"), repo_root]
  else
    distribution_root = File.expand_path(arguments.first, working_directory)
    [distribution_root, File.dirname(distribution_root)]
  end
end

if $PROGRAM_NAME == __FILE__
  distribution_root, repo_root = resolve_roots(ARGV)
  missing, untracked = find_artifact_problems(distribution_root, repo_root)
  exit report_artifact_problems(missing, untracked)
end
