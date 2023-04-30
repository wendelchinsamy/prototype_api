# frozen_string_literal: true

# == Schema Information
#
# Table name: learning_paths
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe(LearningPath, type: :model) do
  subject { build(:learning_path) }

  it { should respond_to(:name) }

  describe "associations" do
    it { should have_many(:courses) }
    it { should have_many(:talent_learning_paths) }
    it { should have_many(:talents) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
  end
end
