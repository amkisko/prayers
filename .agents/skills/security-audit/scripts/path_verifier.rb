# frozen_string_literal: true

require "pathname"

module SecurityAudit
  class PathVerifier
    def initialize(root, strict_links: true)
      @root = File.expand_path(root)
      @strict_links = strict_links
      @line_counts = {}
      @real_root = File.realpath(@root)
    rescue Errno::ENOENT
      @real_root = @root
    end

    def file_errors(relative_path, label)
      return ["#{label} must be a relative path"] unless safe_relative?(relative_path)

      return relaxed_file_errors(relative_path, label) unless @strict_links

      current = @root
      relative_path.split("/").each do |part|
        current = File.join(current, part)
        stat = File.lstat(current)
        return ["#{label} must not contain symlinks: #{relative_path}"] if stat.symlink?
      rescue Errno::ENOENT, Errno::ENOTDIR, Errno::ELOOP
        return ["#{label} does not exist: #{relative_path}"]
      end

      stat = File.lstat(current)
      return ["#{label} must be a regular file: #{relative_path}"] unless stat.file?
      return ["#{label} must not be hard linked: #{relative_path}"] unless stat.nlink == 1

      []
    end

    def source_errors(location, label)
      return ["#{label} must contain path and line"] unless location.is_a?(Hash)

      path = location["path"]
      line = location["line"]
      errors = file_errors(path, "#{label} path")
      return errors unless errors.empty?
      return ["#{label} line must be a positive integer"] unless line.is_a?(Integer) && line.positive?

      line_count = @line_counts[path] ||= File.foreach(File.join(@root, path)).count
      return ["#{label} line #{line} does not exist in #{path}"] if line > line_count

      []
    end

    private

    def relaxed_file_errors(relative_path, label)
      real_path = File.realpath(File.join(@root, relative_path))
      prefix = "#{@real_root}#{File::SEPARATOR}"
      return ["#{label} escapes its root: #{relative_path}"] unless real_path.start_with?(prefix)
      return ["#{label} must be a regular file: #{relative_path}"] unless File.file?(real_path)

      []
    rescue Errno::ENOENT, Errno::ENOTDIR, Errno::ELOOP
      ["#{label} does not exist: #{relative_path}"]
    end

    def safe_relative?(path)
      path.is_a?(String) && !path.empty? && !path.include?("\\") && !Pathname.new(path).absolute? &&
        path.split("/").none? { |part| part.empty? || part == "." || part == ".." }
    end
  end
end
