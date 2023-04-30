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
class TalentLearningPath < ApplicationRecord
  belongs_to :talent
  belongs_to :learning_path

  validates :talent, presence: true
  validates :learning_path, presence: true
  validates :learning_path_id, uniqueness: { scope: :talent_id, message: "already belongs to learning path" }
  validate :learning_path_must_have_course, on: :create

  private

  def learning_path_must_have_course
    return unless learning_path&.courses&.empty?

    errors.add(:learning_path, "does not have any courses assigned")
  end
end
