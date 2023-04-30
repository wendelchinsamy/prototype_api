# frozen_string_literal: true

FactoryBot.define do
  factory :course, class: Course do
    name { Faker::ProgrammingLanguage.name }
    author { build(:author) }
    learning_path { build(:learning_path) }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
