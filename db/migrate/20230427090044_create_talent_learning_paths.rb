# frozen_string_literal: true

class CreateTalentLearningPaths < ActiveRecord::Migration[6.0]
  def change
    create_table(:talent_learning_paths) do |t|
      t.references(:talent, null: false, foreign_key: true)
      t.references(:learning_path, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
