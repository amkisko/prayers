# frozen_string_literal: true

require_relative "object_shape"

module SecurityAudit
  class FindingValidation
    LEVELS = {"low" => 1, "medium" => 2, "high" => 3, "critical" => 4}.freeze
    CONFIDENCE = %w[low medium high].freeze
    VERDICTS = %w[confirmed needs_validation rejected].freeze
    THREAT_FIELDS = %w[lower_trust_principal starting_capability input_or_action
      intended_control crossed_boundary affected_principal_or_resource].freeze
    DOCUMENT_KEYS = %w[schema_version findings].freeze
    FINDING_KEYS = (%w[fingerprint owner validator title verdict likelihood impact severity
      confidence location trace artifact_paths] + THREAT_FIELDS +
      %w[conditions observed_minimum_result smallest_fix blockers validation_plan
        rejection_reason]).freeze
    LOCATION_KEYS = %w[path line].freeze
    TRACE_KEYS = %w[path line role].freeze

    attr_reader :errors, :findings

    def initialize(document, source_verifier, run_verifier)
      @document = document
      @source_verifier = source_verifier
      @run_verifier = run_verifier
      @errors = []
      @findings = []
    end

    def validate
      unless @document.is_a?(Hash) && @document["schema_version"] == 1
        errors << "findings.json schema_version must be 1"
        return self
      end
      ObjectShape.reject_unknown_keys(@document, DOCUMENT_KEYS, "findings.json", errors)
      unless @document["findings"].is_a?(Array)
        errors << "findings.json findings must be an array"
        return self
      end

      @findings = @document["findings"]
      validate_order_and_identity
      findings.each_with_index { |finding, index| validate_finding(finding, index) }
      self
    end

    private

    def validate_order_and_identity
      fingerprints = findings.filter_map { |finding| finding["fingerprint"] if finding.is_a?(Hash) }
      errors << "finding fingerprints must be unique" unless fingerprints.uniq.length == fingerprints.length
      errors << "findings must be sorted by fingerprint" unless fingerprints == fingerprints.sort
    end

    def validate_finding(finding, index)
      label = "finding #{index}"
      unless finding.is_a?(Hash)
        errors << "#{label} must be an object"
        return
      end

      ObjectShape.reject_unknown_keys(finding, FINDING_KEYS, label, errors)
      require_strings(finding, %w[fingerprint owner validator title verdict confidence], label)
      errors << "#{label} validator must differ from owner" if finding["validator"] == finding["owner"]
      validate_enums(finding, label)
      validate_location(finding["location"], "#{label} location")
      validate_trace(finding, label)
      validate_artifacts(finding, label)
      validate_verdict(finding, label)
    end

    def validate_location(location, label)
      ObjectShape.reject_unknown_keys(location, LOCATION_KEYS, label, errors) if location.is_a?(Hash)
      errors.concat(@source_verifier.source_errors(location, label))
    end

    def validate_enums(finding, label)
      unless /\Asha256:[0-9a-f]{64}\z/.match?(finding["fingerprint"])
        errors << "#{label} fingerprint must be sha256 plus 64 lowercase hex characters"
      end
      errors << "#{label} verdict must be #{VERDICTS.join(', ')}" unless VERDICTS.include?(finding["verdict"])
      errors << "#{label} confidence must be #{CONFIDENCE.join(', ')}" unless CONFIDENCE.include?(finding["confidence"])
    end

    def validate_trace(finding, label)
      trace = finding["trace"]
      unless trace.is_a?(Array) && trace.length >= 2
        errors << "#{label} trace must have at least entry and sink"
        return
      end
      trace.each_with_index do |step, index|
        step_label = "#{label} trace #{index}"
        ObjectShape.reject_unknown_keys(step, TRACE_KEYS, step_label, errors) if step.is_a?(Hash)
        errors.concat(@source_verifier.source_errors(step, step_label))
        errors << "#{step_label} role must be a non-empty string" unless step.is_a?(Hash) && present?(step["role"])
      end
      roles = trace.filter_map { |step| step["role"] if step.is_a?(Hash) }
      errors << "#{label} trace must name entry and sink roles" unless roles.include?("entry") && roles.include?("sink")
    end

    def validate_artifacts(finding, label)
      paths = finding["artifact_paths"]
      unless paths.is_a?(Array) && paths.all? { |path| present?(path) }
        errors << "#{label} artifact_paths must be a string array"
        return
      end
      errors << "#{label} confirmed finding needs an artifact" if finding["verdict"] == "confirmed" && paths.empty?
      paths.each do |path|
        prefix = "agents/#{finding['owner']}/artifacts/"
        errors << "#{label} artifact #{path} must belong to #{finding['owner']}" unless path.start_with?(prefix)
        errors.concat(@run_verifier.file_errors(path, "#{label} artifact"))
      end
    end

    def validate_verdict(finding, label)
      case finding["verdict"]
      when "confirmed" then validate_confirmed(finding, label)
      when "needs_validation" then validate_needs_validation(finding, label)
      when "rejected" then validate_rejected(finding, label)
      end
    end

    def validate_confirmed(finding, label)
      require_strings(finding, THREAT_FIELDS + %w[likelihood impact severity observed_minimum_result smallest_fix], label)
      %w[likelihood impact severity].each do |field|
        errors << "#{label} #{field} must be #{LEVELS.keys.join(', ')}" unless LEVELS.key?(finding[field])
      end
      if LEVELS.key?(finding["severity"]) && LEVELS.key?(finding["impact"]) &&
          LEVELS[finding["severity"]] > LEVELS[finding["impact"]]
        errors << "#{label} severity must not exceed demonstrated impact"
      end
      validate_conditions(finding, label)
    end

    def validate_needs_validation(finding, label)
      errors << "#{label} severity is allowed only for confirmed findings" if finding.key?("severity")
      require_strings(finding, THREAT_FIELDS + %w[likelihood impact validation_plan], label)
      %w[likelihood impact].each do |field|
        errors << "#{label} #{field} must be #{LEVELS.keys.join(', ')}" unless LEVELS.key?(finding[field])
      end
      validate_conditions(finding, label)
      blockers = finding["blockers"]
      errors << "#{label} blockers must be a non-empty string array" unless string_array?(blockers, empty: false)
    end

    def validate_rejected(finding, label)
      errors << "#{label} severity is allowed only for confirmed findings" if finding.key?("severity")
      require_strings(finding, %w[rejection_reason], label)
    end

    def validate_conditions(finding, label)
      errors << "#{label} conditions must be a non-empty string array" unless string_array?(finding["conditions"], empty: false)
    end

    def require_strings(object, fields, label)
      fields.each { |field| errors << "#{label} #{field} must be a non-empty string" unless present?(object[field]) }
    end

    def string_array?(value, empty: true)
      value.is_a?(Array) && (empty || !value.empty?) && value.all? { |item| present?(item) }
    end

    def present?(value)
      value.is_a?(String) && !value.empty?
    end
  end
end
