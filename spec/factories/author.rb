# frozen_string_literal: true

FactoryBot.define do
  factory :author, class: Author do
    name { Faker::Superhero.name }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
