# frozen_string_literal: true

class CreateTalents < ActiveRecord::Migration[6.0]
  def change
    create_table(:talents) do |t|
      t.string(:name, null: false)
      t.references(:author, null: true, foreign_key: true, unique: true)

      t.timestamps
    end
  end
end
