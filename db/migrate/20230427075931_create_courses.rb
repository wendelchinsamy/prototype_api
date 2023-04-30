# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table(:courses) do |t|
      t.string(:name, null: false)
      t.references(:author, null: false, foreign_key: true)
      t.references(:learning_path, null: true, foreign_key: true)

      t.timestamps
    end
  end
end
