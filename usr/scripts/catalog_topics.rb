#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "set"

TOPIC_LIMIT = 5
MINIMUM_TOKEN_LENGTH = 4

STOPWORDS = %w[
  a an and are as at be by for from has have in is it its of on or package the this to was we with you your
  about after also although among because before being between both could does done during each either even
  into just more most neither next only other same should since some such than that then their them there
  these they those though through until upon very were what when where which while will within without would
  amkisko
].to_set.freeze

def topics_from_summary(summary)
  seen = Set.new
  topics = []
  summary.to_s.split(/[^[:alnum:]]+/).each do |raw|
    token = raw.downcase
    next if token.length < MINIMUM_TOKEN_LENGTH
    next if token.match?(/\A\d+\z/)
    next if STOPWORDS.include?(token)
    next unless seen.add?(token)

    topics << token
    break if topics.length == TOPIC_LIMIT
  end
  topics
end

def rewrite_catalog_payload(payload)
  versions = payload["versions"]
  return false unless versions.is_a?(Array)

  changed = false
  versions.each do |version|
    metadata = version.is_a?(Hash) ? version["derived_metadata"] : nil
    next unless metadata.is_a?(Hash)

    summary = metadata["summary"]
    next unless summary.is_a?(String) && !summary.strip.empty?

    topics = topics_from_summary(summary)
    next if topics.empty?
    next if metadata["topics"] == topics

    metadata["topics"] = topics
    changed = true
  end
  changed
end

def catalog_paths(distribution_root)
  Dir.glob(File.join(distribution_root, "v1", "packages", "**", "*.json")).sort
end

def rewrite_catalog_files(distribution_root)
  rewritten = 0
  catalog_paths(distribution_root).each do |path|
    payload = JSON.parse(File.read(path, encoding: "UTF-8"))
    next unless rewrite_catalog_payload(payload)

    File.write(path, JSON.pretty_generate(payload) + "\n", encoding: "UTF-8")
    rewritten += 1
  end
  rewritten
end

def report_catalog_topics(rewritten, stdout: $stdout)
  if rewritten.zero?
    stdout.puts "catalog-topics: ok"
  else
    stdout.puts "catalog-topics: rewritten #{rewritten} files"
  end
  0
end

def resolve_distribution_root(arguments, script_directory: __dir__, working_directory: Dir.pwd)
  if arguments.empty?
    File.expand_path("../../prayers", script_directory)
  else
    File.expand_path(arguments.first, working_directory)
  end
end

if $PROGRAM_NAME == __FILE__
  rewritten = rewrite_catalog_files(resolve_distribution_root(ARGV))
  exit report_catalog_topics(rewritten)
end
