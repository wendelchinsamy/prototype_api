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
class Course < ApplicationRecord
  belongs_to :author
  belongs_to :learning_path, optional: true
  has_many :course_talents, dependent: :destroy
  has_many :talents, through: :course_talents

  scope :next_course_id_in_path, lambda { |path_id, created_at|
                                   where(learning_path_id: path_id)
                                     .where("courses.created_at > ?", created_at)
                                     .order(created_at: :desc)
                                     .pluck(:id)
                                     .first
                                 }

  validates :name, presence: true, length: { maximum: 255 }
  validates :author, presence: true
end
