# frozen_string_literal: true

# == Schema Information
#
# Table name: course_talents
#
#  id         :bigint           not null, primary key
#  course_id  :bigint           not null
#  talent_id  :bigint           not null
#  completed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe(CourseTalent, type: :model) do
  subject { build(:course_talent) }

  before :each do
    allow(subject).to(receive(:talent_is_author?)).and_return(false)
  end

  describe "associations" do
    it { should belong_to(:course) }
    it { should belong_to(:talent) }
  end

  describe "validations" do
    it { should validate_presence_of(:completed) }
    it { should validate_presence_of(:course) }
    it { should validate_presence_of(:talent) }
    it {
      should validate_uniqueness_of(:course_id)
        .scoped_to(:talent_id)
        .with_message("already registered for course")
    }
  end
end
