# frozen_string_literal: true

require_relative "object_shape"

module SecurityAudit
  class CoverageValidation
    ACTIVE = %w[covered candidate blocked].freeze
    STATUSES = (ACTIVE + %w[planned deferred out_of_scope]).freeze
    DOCUMENT_KEYS = %w[schema_version units].freeze
    UNIT_KEYS = %w[id attack_class status owner reviewed_paths checks finding_fingerprints unresolved].freeze

    attr_reader :errors, :units

    def initialize(document, source_verifier)
      @document = document
      @source_verifier = source_verifier
      @errors = []
      @units = []
    end

    def validate
      unless @document.is_a?(Hash) && @document["schema_version"] == 1
        errors << "coverage-ledger.json schema_version must be 1"
        return self
      end
      ObjectShape.reject_unknown_keys(@document, DOCUMENT_KEYS, "coverage-ledger.json", errors)
      unless @document["units"].is_a?(Array)
        errors << "coverage-ledger.json units must be an array"
        return self
      end

      @units = @document["units"]
      validate_order_and_identity
      units.each_with_index { |unit, index| validate_unit(unit, index) }
      self
    end

    private

    def validate_order_and_identity
      ids = units.filter_map { |unit| unit["id"] if unit.is_a?(Hash) }
      errors << "coverage unit ids must be unique" unless ids.uniq.length == ids.length
      errors << "coverage units must be sorted by id" unless ids == ids.sort
    end

    def validate_unit(unit, index)
      label = "coverage unit #{index}"
      unless unit.is_a?(Hash)
        errors << "#{label} must be an object"
        return
      end

      ObjectShape.reject_unknown_keys(unit, UNIT_KEYS, label, errors)
      require_strings(unit, %w[id attack_class], label)
      status = unit["status"]
      errors << "#{label} status must be #{STATUSES.join(', ')}" unless STATUSES.include?(status)
      validate_active(unit, label) if ACTIVE.include?(status)
      validate_status_fields(unit, label)
    end

    def validate_active(unit, label)
      require_strings(unit, %w[owner], label)
      %w[reviewed_paths checks].each do |field|
        values = unit[field]
        errors << "#{label} #{field} must be a non-empty string array" unless string_array?(values, empty: false)
      end
      Array(unit["reviewed_paths"]).each do |path|
        errors.concat(@source_verifier.file_errors(path, "#{label} reviewed path"))
      end
    end

    def validate_status_fields(unit, label)
      fingerprints = unit["finding_fingerprints"]
      unresolved = unit["unresolved"]
      unless string_array?(fingerprints) && string_array?(unresolved)
        errors << "#{label} finding_fingerprints and unresolved must be string arrays"
        return
      end

      if unit["status"] == "candidate"
        errors << "#{label} candidate needs a finding fingerprint" if fingerprints.empty?
      elsif !fingerprints.empty?
        errors << "#{label} #{unit['status']} must not have finding fingerprints"
      end
      fingerprints.each do |fingerprint|
        unless /\Asha256:[0-9a-f]{64}\z/.match?(fingerprint)
          errors << "#{label} finding fingerprint must be sha256 plus 64 lowercase hex characters"
        end
      end
      if %w[blocked deferred out_of_scope].include?(unit["status"]) && unresolved.empty?
        errors << "#{label} #{unit['status']} needs an unresolved reason"
      end
      if %w[planned covered candidate].include?(unit["status"]) && !unresolved.empty?
        errors << "#{label} #{unit['status']} must not have unresolved reasons"
      end
      validate_inactive(unit, label) unless ACTIVE.include?(unit["status"])
    end

    def validate_inactive(unit, label)
      has_work = present?(unit["owner"]) || Array(unit["reviewed_paths"]).any? || Array(unit["checks"]).any?
      if has_work
        errors << "#{label} #{unit['status']} must not have owner, reviewed paths, or checks"
      end
    end

    def require_strings(object, fields, label)
      fields.each do |field|
        value = object[field]
        errors << "#{label} #{field} must be a non-empty string" unless value.is_a?(String) && !value.empty?
      end
    end

    def string_array?(value, empty: true)
      value.is_a?(Array) && (empty || !value.empty?) && value.all? { |item| item.is_a?(String) && !item.empty? }
    end

    def present?(value)
      value.is_a?(String) && !value.empty?
    end
  end
end
