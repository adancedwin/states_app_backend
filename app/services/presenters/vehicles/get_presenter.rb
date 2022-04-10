# frozen_string_literal: true

module Presenters
  module Vehicles
    class GetPresenter < BasePresenter
      def call(params)
        { vehicle: vehicle(params) }
      end

      private

      def vehicle(params)
        vehicle = Vehicle.find(params[:id])

        {
          id: vehicle.id,
          states_data: vehicle.states_data,
          current_state_index: vehicle.current_state_index
        }
      end
    end
  end
end
