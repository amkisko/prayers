#!/usr/bin/env ruby
# frozen_string_literal: true

require "open3"
require "rubygems"

def version_problem(label, observed, minimum)
  match = observed.match(/\b\d+\.\d+\.\d+/)
  return "#{label}: could not parse a semantic version from #{observed.strip.inspect}" unless match
  return "" if Gem::Version.new(match[0]) >= Gem::Version.new(minimum)

  "#{label}: requires >= #{minimum}, found #{match[0]}"
end

if $PROGRAM_NAME == __FILE__
  label = ARGV.shift
  minimum = ARGV.shift
  command = ARGV
  if label.nil? || minimum.nil? || command.empty?
    warn "usage: check_tool_version.rb LABEL MINIMUM COMMAND [ARG ...]"
    exit 2
  end

  stdout, stderr, status = Open3.capture3(*command)
  unless status.success?
    warn "#{label}: version command failed: #{stderr.strip}"
    exit 1
  end

  problem = version_problem(label, "#{stdout}#{stderr}", minimum)
  unless problem.empty?
    warn problem
    exit 1
  end
end
