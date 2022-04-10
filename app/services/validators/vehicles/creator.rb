# frozen_string_literal: true

module Validators
  module Vehicles
    class Creator < Validators::Base
      params do
        required(:vehicle).hash do
          optional(:name).maybe(:str?)
          required(:states_data).each(:str?)
        end
      end
    end
  end
end
