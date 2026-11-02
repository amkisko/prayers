#!/usr/bin/env ruby
# frozen_string_literal: true

MAXIMUM_AGENT_CONTEXT_BYTES = 16 * 1024

def agent_context_problem(path, maximum_bytes: MAXIMUM_AGENT_CONTEXT_BYTES)
  return "agent context not found: #{path}" unless File.file?(path)

  bytes = File.size(path)
  return nil if bytes <= maximum_bytes

  "#{path}: #{bytes} bytes exceeds #{maximum_bytes} byte agent context budget"
end

if $PROGRAM_NAME == __FILE__
  path = ARGV.first || "AGENTS.md"
  problem = agent_context_problem(path)
  if problem
    warn problem
    exit 1
  end

  puts "check-agent-context: ok (#{File.size(path)}/#{MAXIMUM_AGENT_CONTEXT_BYTES} bytes)"
end
