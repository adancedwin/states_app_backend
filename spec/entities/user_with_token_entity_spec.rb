# frozen_string_literal: true

require 'rails_helper'

describe Entities::UserWithTokenEntity do
  context 'fields' do
    let!(:token) { create :authentication_token }
    it 'presents the first available token' do
      json = Entities::UserWithTokenEntity.new(token.user).as_json
      expect(json[:token]).to be_present
    end
  end
end
