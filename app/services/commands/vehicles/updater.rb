# frozen_string_literal: true

module Commands
  module Vehicles
    class Updater < Commands::Base
      def call(params)
        validate_params(params)
        record_id = update!(params).id
        return_success(json_id(record_id))
      end

      private

      def validate_params(params)
        result = Validators::Vehicles::Updater.new.call(params)

        return result.to_h if result.success?

        halt(result)
      end

      def update!(params)
        Vehicle.update!(
          states_data: params[:states_data],
          current_state_index: params[:current_state_index]
        )
      end
    end
  end
end
