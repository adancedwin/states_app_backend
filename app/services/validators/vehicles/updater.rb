# frozen_string_literal: true

module Validators
  module Vehicles
    class Updater < Validators::Base
      params do
        required(:id).filled(:int?)
        required(:vehicle).hash do
          required(:states_data).filled(:hash)
          required(:current_state_index).filled(:int?)
        end
      end

      rule(:id) do
        key.failure('not found') if Vehicle.exists?(value)
      end
    end
  end
end
