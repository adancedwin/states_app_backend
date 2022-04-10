# frozen_string_literal: true

module Validators
  module Vehicles
    class StateChanger < Validators::Base
      params do
        required(:id).filled(:int?)
        required(:vehicle).hash do
          required(:new_state_index).filled(:int?)
        end
      end

      rule(:id) do
        key.failure('not found') if Vehicle.exists?(value)
      end
    end
  end
end
