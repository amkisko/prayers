#!/usr/bin/env ruby
# frozen_string_literal: true

require "optparse"
require_relative "run_validation"

options = {}
OptionParser.new do |parser|
  parser.banner = "Usage: validate_run.rb --target PATH --run-directory PATH"
  parser.on("--target PATH", "Audited source tree") { |path| options[:target] = path }
  parser.on("--run-directory PATH", "Security audit run directory") { |path| options[:run_directory] = path }
end.parse!

unless options.values_at(:target, :run_directory).all?
  warn "both --target and --run-directory are required"
  exit 2
end

errors = SecurityAudit::RunValidator.new(**options).errors
if errors.empty?
  puts "security audit run is valid"
  exit 0
end

errors.each { |error| warn error }
exit 1
