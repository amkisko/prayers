#!/usr/bin/env ruby
# frozen_string_literal: true

# Fail package prayer markdown that uses non-mandatory styling or inaccessible
# Unicode punctuation. README.md files are skipped. Code fences and YAML
# frontmatter are ignored. See writing-prose and .agents/project.md.

require "pathname"

BOLD_PATTERN = /
  \*\*[^*\n]+\*\*
  |
  __[^_\n]+__
/x

# Single-marker italic is not checked: globs like v*.*.* and snake_case collide.
TABLE_LINE_PATTERN = /^\|.+\|\s*$/
FENCE_PATTERN = /```[\s\S]*?```/

def non_ascii_punctuation?(character)
  return false if character.ord < 128

  # Letters and numbers (including accented) are allowed in quoted names.
  # Everything else above ASCII is treated as inaccessible structure.
  !(character.match?(/\A\p{L}\z/) || character.match?(/\A\p{N}\z/))
end

def problem_for_line(path, line_number, line)
  return { path: path, line: line_number, message: "markdown table row" } if line.match?(TABLE_LINE_PATTERN)
  return { path: path, line: line_number, message: "bold emphasis" } if line.match?(BOLD_PATTERN)

  line.each_char do |character|
    next unless non_ascii_punctuation?(character)

    return {
      path: path,
      line: line_number,
      message: "non-ASCII punctuation #{character.inspect} (U+#{character.ord.to_s(16).upcase})"
    }
  end

  nil
end

def skip_ranges_for(text)
  ranges = []

  if text.start_with?("---\n")
    closing = text.index("\n---\n", 4)
    ranges << (0...(closing + 5)) if closing
  end

  text.to_enum(:scan, FENCE_PATTERN).each do
    match = Regexp.last_match
    ranges << (match.begin(0)...match.end(0))
  end

  ranges
end

def offset_skipped?(offset, ranges)
  ranges.any? { |range| offset >= range.begin && offset < range.end }
end

def package_markdown_paths(packages_root)
  Dir.glob(File.join(packages_root, "**", "*.md")).sort.reject do |path|
    File.basename(path) == "README.md"
  end
end

def find_prayer_prose_problems(repo_root)
  packages_root = File.join(repo_root, "packages")
  return [] unless Dir.exist?(packages_root)

  package_markdown_paths(packages_root).flat_map do |path|
    raw = File.read(path, encoding: "UTF-8")
    skips = skip_ranges_for(raw)
    display = begin
      Pathname.new(path).relative_path_from(Pathname.new(repo_root)).to_s
    rescue ArgumentError
      path
    end

    offset = 0
    raw.each_line.with_index(1).filter_map do |line, line_number|
      skipped = offset_skipped?(offset, skips)
      offset += line.length
      next if skipped

      problem_for_line(display, line_number, line)
    end
  end
end

def format_prayer_prose_problems(problems)
  problems.map do |problem|
    "#{problem[:path]}:#{problem[:line]}: #{problem[:message]}"
  end
end

if $PROGRAM_NAME == __FILE__
  root = ARGV[0] || Dir.pwd
  problems = find_prayer_prose_problems(root)
  if problems.empty?
    puts "check-prayer-prose: ok"
    exit 0
  end

  warn "check-prayer-prose: failed"
  format_prayer_prose_problems(problems).each { |line| warn line }
  exit 1
end
