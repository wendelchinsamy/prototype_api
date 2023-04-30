# frozen_string_literal: true

FactoryBot.define do
  factory :talent_learning_path, class: TalentLearningPath do
    talent { build(:talent) }
    learning_path { build(:learning_path) }
  end
end
