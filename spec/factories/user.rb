# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    password { 'Password' }
    password_confirmation(&:password)

    sequence(:email) { |n| "test#{n}@example.com" }
  end
end
