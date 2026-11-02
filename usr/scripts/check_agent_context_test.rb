# frozen_string_literal: true

require "minitest/autorun"
require "tmpdir"
require_relative "check_agent_context"

class CheckAgentContextTest < Minitest::Test
  def test_accepts_context_at_budget
    Dir.mktmpdir do |directory|
      path = File.join(directory, "AGENTS.md")
      File.write(path, "a" * 16)
      assert_nil agent_context_problem(path, maximum_bytes: 16)
    end
  end

  def test_rejects_context_over_budget
    Dir.mktmpdir do |directory|
      path = File.join(directory, "AGENTS.md")
      File.write(path, "a" * 17)
      assert_includes agent_context_problem(path, maximum_bytes: 16), "17 bytes exceeds 16"
    end
  end
end
