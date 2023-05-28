# frozen_string_literal: true

class CreateMiniBlarghs < ActiveRecord::Migration[7.0]
  def change
    create_table :mini_blarghs do |t|
      t.text :body
      t.integer :author_id

      t.timestamps
    end
  end
end
