# frozen_string_literal: true

module Commands
  module Vehicles
    class StateChanger < Commands::Base
      def call(params)
        validate_params(params)
        change_state!(params)
        return_success(json_id(params[:id]))
      end

      private

      def validate_params(params)
        result = Validators::Vehicles::StateChanger.new.call(params)

        return result.to_h if result.success?

        halt(result)
      end

      def change_state!(params)
        DynamicStateMachine.new(Vehicle.find(params[:id]))
                           .transition!(params[:vehicle][:new_state_index])
      end
    end
  end
end
