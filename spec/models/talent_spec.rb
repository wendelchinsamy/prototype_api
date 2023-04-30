# frozen_string_literal: true

# == Schema Information
#
# Table name: talents
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  author_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe(Talent, type: :model) do
  subject { create(:talent) }

  it { should respond_to(:name) }

  describe "associations" do
    it { should belong_to(:author).optional }
    it { should have_many(:course_talents) }
    it { should have_many(:courses) }
    it { should have_many(:talent_learning_paths) }
    it { should have_many(:learning_paths) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
    it { should validate_uniqueness_of(:author_id).with_message("is already a talent") }
  end
end
