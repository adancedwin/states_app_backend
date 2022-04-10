# frozen_string_literal: true

module Commands
  module Vehicles
    class Creator < Commands::Base
      def call(params)
        validate_params(params)
        record_id = create_new!(params).id
        return_success(json_id(record_id))
      end

      private

      def validate_params(params)
        result = Validators::Vehicles::Creator.new.call(params)

        return result.to_h if result.success?

        halt(result)
      end

      def create_new!(params)
        Vehicle.create!(
          name: params[:name],
          states_data: params[:states_data]
        )
      end
    end
  end
end
