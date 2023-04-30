# frozen_string_literal: true

FactoryBot.define do
  factory :talent, class: Talent do
    name { Faker::Superhero.name }
    author { build(:author) }
  end
end
