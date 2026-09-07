#!/usr/bin/env ruby
# frozen_string_literal: true

# Psych parses SKILL.md frontmatter.
require "yaml"

NAME_PATTERN = /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/
MAXIMUM_NAME_LENGTH = 64
MAXIMUM_DESCRIPTION_LENGTH = 1024

def package_skill_directories(repository_root)
  pattern = File.join(repository_root, "packages", "*", "skills", "*", "SKILL.md")
  Dir.glob(pattern).map { |path| File.dirname(path) }.sort
end

def validate_skill(skill_directory)
  skill_markdown = File.join(skill_directory, "SKILL.md")
  return [false, "SKILL.md not found"] unless File.file?(skill_markdown)

  content = File.read(skill_markdown, encoding: "UTF-8")
  unless content.start_with?("---")
    return [false, "No YAML frontmatter"]
  end

  parts = content.split("---", 3)
  if parts.length < 3
    return [false, "Invalid frontmatter format"]
  end

  begin
    frontmatter = YAML.safe_load(parts[1], permitted_classes: [], aliases: false)
  rescue Psych::SyntaxError, Psych::DisallowedClass => error
    return [false, "Invalid YAML: #{error.message}"]
  end

  unless frontmatter.is_a?(Hash)
    return [false, "Frontmatter must be a mapping"]
  end
  unless frontmatter.key?("name")
    return [false, "Missing name in frontmatter"]
  end
  unless frontmatter.key?("description")
    return [false, "Missing description in frontmatter"]
  end

  name = frontmatter["name"]
  unless name.is_a?(String)
    return [false, "Name must be a string"]
  end
  name = name.strip
  if name.empty?
    return [false, "Name is empty"]
  end
  if name.length > MAXIMUM_NAME_LENGTH
    return [false, "Name is #{name.length} characters (max #{MAXIMUM_NAME_LENGTH})"]
  end
  unless NAME_PATTERN.match?(name)
    return [false, "Name #{name.inspect} must be lowercase letters, numbers, and hyphens"]
  end

  description = frontmatter["description"]
  unless description.is_a?(String)
    return [false, "Description must be a string"]
  end
  description = description.strip
  if description.empty?
    return [false, "Description is empty"]
  end
  if description.length > MAXIMUM_DESCRIPTION_LENGTH
    return [
      false,
      "Description is #{description.length} characters (max #{MAXIMUM_DESCRIPTION_LENGTH})"
    ]
  end

  [true, "#{File.basename(skill_directory)} is valid"]
end

if $PROGRAM_NAME == __FILE__
  repository_root = File.expand_path("../..", __dir__)
  skill_directories = if ARGV.empty?
    package_skill_directories(repository_root)
  else
    ARGV
  end

  if skill_directories.empty?
    warn "no skill directories found"
    exit 1
  end

  failed = false
  skill_directories.each do |skill_directory|
    valid, message = validate_skill(skill_directory)
    if valid
      puts message
    else
      warn "#{skill_directory}: #{message}"
      failed = true
    end
  end
  exit(failed ? 1 : 0)
end
