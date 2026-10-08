# frozen_string_literal: true

require "fileutils"
require "minitest/autorun"
require "tmpdir"
require_relative "check_prayer_prose"

class CheckPrayerProseTest < Minitest::Test
  def write_package_markdown(root, relative, body)
    path = File.join(root, relative)
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, body)
    path
  end

  def test_accepts_plain_prose_package_markdown
    Dir.mktmpdir do |root|
      write_package_markdown(root, "packages/example/exports/example.md", <<~MARKDOWN)
        ## Example

        - Prefer ASCII `->` and plain words.
        - Use headings and bullets when needed.
      MARKDOWN

      problems = find_prayer_prose_problems(root)
      assert_empty problems
    end
  end

  def test_skips_readme_files
    Dir.mktmpdir do |root|
      write_package_markdown(root, "packages/example/README.md", <<~MARKDOWN)
        # Example

        **Bold** in README stays out of this check.
      MARKDOWN

      problems = find_prayer_prose_problems(root)
      assert_empty problems
    end
  end

  def test_rejects_markdown_table_outside_fences
    Dir.mktmpdir do |root|
      write_package_markdown(root, "packages/example/exports/example.md", <<~MARKDOWN)
        | A | B |
        |---|---|
        | 1 | 2 |
      MARKDOWN

      problems = find_prayer_prose_problems(root)
      refute_empty problems
      assert(problems.any? { |problem| problem[:message].include?("markdown table") })
      assert_equal "packages/example/exports/example.md", problems.first[:path]
    end
  end

  def test_rejects_bold_emphasis
    Dir.mktmpdir do |root|
      write_package_markdown(root, "packages/example/skills/example/SKILL.md", <<~MARKDOWN)
        ---
        name: example
        description: Example skill.
        ---

        Do not use **bold** for emphasis.
      MARKDOWN

      problems = find_prayer_prose_problems(root)
      assert_equal 1, problems.size
      assert_equal "packages/example/skills/example/SKILL.md", problems.first[:path]
      assert_equal 6, problems.first[:line]
      assert_includes problems.first[:message], "bold"
    end
  end

  def test_reports_original_line_after_code_fence
    Dir.mktmpdir do |root|
      write_package_markdown(root, "packages/example/exports/example.md", <<~MARKDOWN)
        Intro

        ```text
        a → b
        ```

        Bad **bold** here
      MARKDOWN

      problems = find_prayer_prose_problems(root)
      assert_equal 1, problems.size
      assert_equal 7, problems.first[:line]
      assert_includes problems.first[:message], "bold"
    end
  end

  def test_rejects_unicode_arrow
    Dir.mktmpdir do |root|
      write_package_markdown(root, "packages/example/exports/example.md", <<~MARKDOWN)
        Next step → done
      MARKDOWN

      problems = find_prayer_prose_problems(root)
      assert_equal 1, problems.size
      assert_equal "packages/example/exports/example.md", problems.first[:path]
      assert_includes problems.first[:message], "non-ASCII"
    end
  end

  def test_ignores_table_and_arrow_inside_code_fence
    Dir.mktmpdir do |root|
      write_package_markdown(root, "packages/example/exports/example.md", <<~MARKDOWN)
        Example fence:

        ```text
        a → b
        | not a real table |
        ```

        Plain follow-up.
      MARKDOWN

      problems = find_prayer_prose_problems(root)
      assert_empty problems
    end
  end

  def test_ignores_yaml_frontmatter_delimiters
    Dir.mktmpdir do |root|
      write_package_markdown(root, "packages/example/skills/example/SKILL.md", <<~MARKDOWN)
        ---
        name: example
        description: Example skill.
        ---

        Body text only.
      MARKDOWN

      problems = find_prayer_prose_problems(root)
      assert_empty problems
    end
  end
end
