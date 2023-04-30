# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id               :bigint           not null, primary key
#  name             :string           not null
#  author_id        :bigint           not null
#  learning_path_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "rails_helper"

RSpec.describe(Course, type: :model) do
  subject { build(:course) }

  it { should respond_to(:name) }

  describe "associations" do
    it { should belong_to(:author) }
    it { should belong_to(:learning_path).optional }
    it { should have_many(:course_talents) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
    it { should validate_presence_of(:author) }
  end
end
