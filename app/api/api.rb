# frozen_string_literal: true

class API < Grape::API
  prefix :api

  default_format :json
  format :json
  content_type :json, 'application/json'

  rescue_from Grape::Exceptions::ValidationErrors do |e|
    rack_response({
      status: e.status,
      error_msg: e.message
    }.to_json, 400)
  end

  rescue_from ValidationError do |e|
    error!({ error: { code: '400', fatal: false, message: e.message } }, 400)
  end

  rescue_from StateTransitionError do |_e|
    error!({ error: { code: '400', fatal: false, message: 'State transition failed' } }, 400)
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    error!({ error: { code: '404', fatal: false, message: e.message } }, 404)
  end

  rescue_from :all do |e|
    Rails.logger.error e
    error!({ error: { code: '500', fatal: true, message: e.message } }, 500)
  end

  mount Login
  mount API::V1::Base
end
