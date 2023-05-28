# frozen_string_literal: true

class AddBlarghIdToMiniBlarghs < ActiveRecord::Migration[7.0]
  def change
    add_column :mini_blarghs, :blargh_id, :integer
  end
end
