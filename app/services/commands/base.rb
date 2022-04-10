# frozen_string_literal: true

require 'json'

module Commands
  class Base

    def self.call
      new.call
    end

    private

    def return_success(message = 'OK')
      { code: '200', body: message }
    end

    def validate_params(_params)
      raise NoMethodError
    end

    def halt(result)
      raise ValidationError, build_error_message(result)
    end

    def build_error_message(result)
      result.errors.to_h.each_with_object([]) do |(key, error), message|
        message << "#{key} #{error.join(', ')}"
      end.join(', ')
    end

    def json_id(record_id)
      { id: record_id }
    end
  end
end
