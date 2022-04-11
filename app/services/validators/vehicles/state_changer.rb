# frozen_string_literal: true

module Validators
  module Vehicles
    class StateChanger < Validators::Base
      params do
        required(:id)
        required(:vehicle).hash do
          required(:new_state_index)
        end
      end

      rule(:id) do
        Integer(value)
        key.failure('not found') unless Vehicle.exists?(value)

      rescue ArgumentError
        key.failure('is not correct')
      end

      rule('vehicle.new_state_index') do
        Integer(value)

      rescue ArgumentError
        key.failure('is not correct')
      end
    end
  end
end
