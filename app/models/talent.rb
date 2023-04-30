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
class Talent < ApplicationRecord
  belongs_to :author, optional: true
  has_many :course_talents, dependent: :destroy
  has_many :courses, through: :course_talents
  has_many :talent_learning_paths, dependent: :destroy
  has_many :learning_paths, through: :talent_learning_paths

  validates :name, presence: true, length: { maximum: 255 }
  validates :author_id, uniqueness: { message: "is already a talent" }, allow_blank: true
end
