# frozen_string_literal: true

require 'rails_helper'

describe API::V1::VehicleResource do
  let(:user) { create :user }
  let(:token) { create :authentication_token, user: user }
  let(:vehicle) { create :vehicle }
  let(:original_params) { { token: token.token } }
  let(:vehicle_params) { {} }
  let(:params) { original_params.merge(vehicle_params) }

  context 'unauthenticated' do
    let(:params) { original_params.except(:token) }
    let(:subject) { get "/api/v1/vehicles/#{vehicle.id}", params: params }

    it 'returns 401 without token' do
      subject
      expect(response.status).to eq(401)
    end
  end

  context 'no admin rights' do
    let(:subject) { get '/api/v1/admin/vehicles', params: params }

    it 'returns 401 without admin rights' do
      subject
      expect(response.status).to eq(401)
    end
  end

  describe 'GET /api/v1/vehicles/:id' do
    let(:subject) { get "/api/v1/vehicles/#{vehicle.id}", params: params }

    context 'valid params' do
      it_behaves_like '200'
      it_behaves_like 'json result'
    end
  end

  describe 'POST /api/v1/vehicles/:id/change_state' do
    let(:vehicle_params) do
      { vehicle: { new_state_index: 1 } }
    end
    let(:subject) { post "/api/v1/vehicles/#{vehicle.id}/change_state", params: params }

    context 'valid params' do
      it_behaves_like '201'
      it_behaves_like 'json result'
    end
  end

  describe 'POST /api/v1/admin/vehicles' do
    let(:vehicle_params) do
      { vehicle: { name: Faker::Lorem.word, states_data: %w[D A P T] } }
    end
    let(:user) { create :user, admin: true }
    let(:subject) { post '/api/v1/admin/vehicles', params: params }

    context 'valid params' do
      it_behaves_like '201'
      it_behaves_like 'json result'
    end
  end

  describe 'POST /api/v1/admin/vehicles/:id' do
    let(:user) { create :user, admin: true }
    let(:vehicle_params) do
      { vehicle: { states_data: %w[D A T P], current_state_index: 2 } }
    end
    let(:subject) { post "/api/v1/admin/vehicles/#{vehicle.id}", params: params }

    context 'valid params' do
      it_behaves_like '201'
      it_behaves_like 'json result'
    end
  end

  describe 'GET /api/v1/admin/vehicles' do
    let(:user) { create :user, admin: true }
    let(:subject) { get '/api/v1/admin/vehicles', params: params }

    context 'valid params' do
      it_behaves_like '200'
      it_behaves_like 'json result'
    end
  end

  describe 'POST /api/v1/admin/vehicles/:id/delete' do
    let(:user) { create :user, admin: true }
    let(:subject) { post "/api/v1/admin/vehicles/#{vehicle.id}/delete", params: params }

    context 'valid params' do
      it_behaves_like '201'
      it_behaves_like 'json result'
    end
  end
end
