# frozen_string_literal: true

FactoryBot.define do
  factory :authentication_token do
    token { SecureRandom.uuid }
    expires_at { 1.day.from_now }
    user
  end
end
