# frozen_string_literal: true

class CreateCourseTalents < ActiveRecord::Migration[6.0]
  def change
    create_table(:course_talents) do |t|
      t.references(:course, null: false, foreign_key: true)
      t.references(:talent, null: false, foreign_key: true)
      t.boolean(:completed)

      t.timestamps
    end
  end
end
