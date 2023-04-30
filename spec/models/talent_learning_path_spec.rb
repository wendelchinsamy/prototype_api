# frozen_string_literal: true

# == Schema Information
#
# Table name: talent_learning_paths
#
#  id               :bigint           not null, primary key
#  talent_id        :bigint           not null
#  learning_path_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "rails_helper"

RSpec.describe(TalentLearningPath, type: :model) do
  subject { build(:talent_learning_path) }

  describe "associations" do
    it { should belong_to(:talent) }
    it { should belong_to(:learning_path) }
  end

  describe "validations" do
    it { should validate_presence_of(:talent) }
    it { should validate_presence_of(:learning_path) }
    it {
      should validate_uniqueness_of(:learning_path_id)
        .scoped_to(:talent_id)
        .with_message("already belongs to learning path")
    }
  end
end
