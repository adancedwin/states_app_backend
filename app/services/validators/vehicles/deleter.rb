# frozen_string_literal: true

module Validators
  module Vehicles
    class Deleter < Validators::Base
      params do
        required(:id)
      end

      rule(:id) do
        Integer(value)
        key.failure('not found') unless Vehicle.exists?(value)

      rescue ArgumentError
        key.failure('is not correct')
      end
    end
  end
end
