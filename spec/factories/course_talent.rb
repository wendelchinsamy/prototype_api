# frozen_string_literal: true

FactoryBot.define do
  factory :course_talent, class: CourseTalent do
    course { build(:course) }
    talent { build(:talent) }
    completed { true }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
