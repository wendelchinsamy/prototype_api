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
class CourseTalent < ApplicationRecord
  after_validation :talent_is_author?, on: [:create, :update]

  belongs_to :course
  belongs_to :talent

  validates :course, presence: true
  validates :talent, presence: true
  validates :completed, inclusion: { in: [true, false], message: "can't be blank" }
  validates :course_id, uniqueness: { scope: :talent_id, message: "already registered for course" }

  private

  def talent_is_author?
    return unless course&.author_id == talent&.author_id

    errors.add(:talent, "cannot register for own course")
  end
end
