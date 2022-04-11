# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    name { Faker::Lorem.word }
    states_data { %w[D A P T] }
  end
end
