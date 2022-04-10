# frozen_string_literal: true

module Commands
  module Vehicles
    class Deleter < Commands::Base
      def call(params)
        validate_params(params)
        delete!(params)
        return_success
      end

      private

      def validate_params(params)
        result = Validators::Vehicles::Deleter.new.call(params)

        return result.to_h if result.success?

        halt(result)
      end

      def delete!(params)
        Vehicle.destroy(params[:id])
      end
    end
  end
end
