# frozen_string_literal: true

FactoryBot.define do
  factory :learning_path, class: LearningPath do
    name { Faker::University.name }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
