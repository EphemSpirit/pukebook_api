class CreateBlarghs < ActiveRecord::Migration[7.0]
  def change
    create_table :blarghs do |t|
      t.integer :author_id
      t.text :body

      t.timestamps
    end
  end
end
