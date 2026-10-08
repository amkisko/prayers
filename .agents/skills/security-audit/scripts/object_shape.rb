# frozen_string_literal: true

module SecurityAudit
  module ObjectShape
    module_function

    def reject_unknown_keys(object, allowed, label, errors)
      return unless object.is_a?(Hash)

      unknown = object.keys - allowed
      unknown.sort.each { |key| errors << "#{label} has unknown field #{key}" }
    end
  end
end
