# frozen_string_literal: true

module Validators
  module Vehicles
    class Deleter < Validators::Base
      params do
        required(:id).filled(:int?)
      end

      rule(:id) do
        key.failure('not found') if Vehicle.exists?(value)
      end
    end
  end
end
