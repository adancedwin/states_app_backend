# frozen_string_literal: true

module Commands
  module Vehicles
    class Updater < Commands::Base
      def call(params)
        validate_params(params)
        update!(params)
        return_success(json_id(params[:id]))
      end

      private

      def validate_params(params)
        result = Validators::Vehicles::Updater.new.call(params)

        return result.to_h if result.success?

        halt(result)
      end

      def update!(params)
        Vehicle.update!(
          id: params[:id],
          states_data: params[:states_data],
          current_state_index: params[:current_state_index]
        )
      end
    end
  end
end
