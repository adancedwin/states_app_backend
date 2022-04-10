# frozen_string_literal: true

module Presenters
  module Vehicles
    class IndexPresenter < BasePresenter
      def call
        {
          vehicles: list_vehicles
        }
      end

      private

      def list_vehicles
        vehicles = Vehicle.all

        vehicles.each_with_object([]) do |vehicle, array|
          array << {
            id: vehicle.id,
            states_data: vehicle.states_data,
            current_state_index: vehicle.current_state_index
          }
        end
      end
    end
  end
end
