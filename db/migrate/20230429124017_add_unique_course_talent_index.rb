# frozen_string_literal: true

class AddUniqueCourseTalentIndex < ActiveRecord::Migration[6.0]
  def change
    add_index(:course_talents, [:course_id, :talent_id], unique: true)
  end
end
