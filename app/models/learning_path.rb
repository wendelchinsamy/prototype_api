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
class LearningPath < ApplicationRecord
  has_many :courses, dependent: :nullify
  has_many :talent_learning_paths, dependent: :destroy
  has_many :talents, through: :talent_learning_paths

  validates :name, presence: true, length: { maximum: 255 }
end
