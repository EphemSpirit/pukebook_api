# frozen_string_literal: true

class MiniBlargh < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_one :mini_blargh_images, as: :imageable

  validates :body, presence: true
  validates :body, length: { maximum: 100 }
end
