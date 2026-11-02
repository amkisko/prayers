# frozen_string_literal: true

require "minitest/autorun"
require_relative "check_tool_version"

class CheckToolVersionTest < Minitest::Test
  def test_accepts_minimum_version
    assert_empty version_problem("Pray", "pray 1.26.0", "1.26.0")
  end

  def test_accepts_newer_version_with_extra_text
    assert_empty version_problem("Ruby", "ruby 4.0.7 +PRISM", "3.4.0")
  end

  def test_parses_ruby_patchlevel_suffix
    assert_includes version_problem("Ruby", "ruby 2.6.10p210", "3.4.0"), "found 2.6.10"
  end

  def test_rejects_older_version
    assert_includes version_problem("Pray", "pray 1.17.0 (typescript)", "1.26.0"), "requires >= 1.26.0"
  end

  def test_rejects_output_without_a_semantic_version
    assert_includes version_problem("Pray", "unknown", "1.26.0"), "could not parse"
  end
end
