# frozen_string_literal: true

require "minitest/autorun"
require "tmpdir"
require_relative "validate_skill"

class ValidateSkillTest < Minitest::Test
  def write_skill(directory, body)
    File.write(File.join(directory, "SKILL.md"), body)
  end

  def assert_valid(directory)
    valid, message = validate_skill(directory)
    assert valid, message
  end

  def assert_invalid(directory, fragment)
    valid, message = validate_skill(directory)
    refute valid, message
    assert_includes message, fragment
  end

  def test_accepts_single_line_description
    Dir.mktmpdir do |directory|
      write_skill(directory, <<~MARKDOWN)
        ---
        name: example-skill
        description: Update changelogs in house style.
        ---

        # Example
      MARKDOWN
      assert_valid(directory)
    end
  end

  def test_accepts_folded_description
    Dir.mktmpdir do |directory|
      write_skill(directory, <<~MARKDOWN)
        ---
        name: example-skill
        description: >-
          Audit dependencies.
          Use when adding a package.
        ---

        # Example
      MARKDOWN
      assert_valid(directory)
    end
  end

  def test_rejects_missing_skill_file
    Dir.mktmpdir do |directory|
      assert_invalid(directory, "SKILL.md not found")
    end
  end

  def test_rejects_missing_frontmatter
    Dir.mktmpdir do |directory|
      write_skill(directory, "# Example\n")
      assert_invalid(directory, "frontmatter")
    end
  end

  def test_rejects_invalid_yaml
    Dir.mktmpdir do |directory|
      write_skill(directory, <<~MARKDOWN)
        ---
        name: [unterminated
        description: nope
        ---

        # Example
      MARKDOWN
      assert_invalid(directory, "YAML")
    end
  end

  def test_rejects_missing_name
    Dir.mktmpdir do |directory|
      write_skill(directory, <<~MARKDOWN)
        ---
        description: A skill without a name.
        ---

        # Example
      MARKDOWN
      assert_invalid(directory, "name")
    end
  end

  def test_rejects_missing_description
    Dir.mktmpdir do |directory|
      write_skill(directory, <<~MARKDOWN)
        ---
        name: example-skill
        ---

        # Example
      MARKDOWN
      assert_invalid(directory, "description")
    end
  end

  def test_rejects_empty_description
    Dir.mktmpdir do |directory|
      write_skill(directory, <<~MARKDOWN)
        ---
        name: example-skill
        description: "   "
        ---

        # Example
      MARKDOWN
      assert_invalid(directory, "empty")
    end
  end

  def test_rejects_uppercase_name
    Dir.mktmpdir do |directory|
      write_skill(directory, <<~MARKDOWN)
        ---
        name: Example-Skill
        description: Not hyphen-case.
        ---

        # Example
      MARKDOWN
      assert_invalid(directory, "lowercase")
    end
  end

  def test_rejects_name_longer_than_64_characters
    Dir.mktmpdir do |directory|
      write_skill(directory, <<~MARKDOWN)
        ---
        name: #{'a' * 65}
        description: Name exceeds the limit.
        ---

        # Example
      MARKDOWN
      assert_invalid(directory, "64")
    end
  end

  def test_rejects_description_longer_than_1024_characters
    Dir.mktmpdir do |directory|
      write_skill(directory, <<~MARKDOWN)
        ---
        name: example-skill
        description: #{'d' * 1025}
        ---

        # Example
      MARKDOWN
      assert_invalid(directory, "1024")
    end
  end

  def test_accepts_name_and_description_at_maximum_length
    Dir.mktmpdir do |directory|
      write_skill(directory, <<~MARKDOWN)
        ---
        name: #{'a' * 64}
        description: #{'d' * 1024}
        ---

        # Example
      MARKDOWN
      assert_valid(directory)
    end
  end

  def test_package_skills_are_valid
    package_skill_directories(repository_root).each do |directory|
      assert_valid(directory)
    end
  end

  def repository_root
    File.expand_path("../..", __dir__)
  end
end
