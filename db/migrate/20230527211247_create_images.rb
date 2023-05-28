# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.bigint :imageable_id
      t.string :imageable_type

      t.timestamps
    end
    add_index :images, %i[imageable_type imageable_id]
  end
end
