# frozen_string_literal: true

class Blargh < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :blargh_images, as: :imageable
  has_many :mini_blarghs, dependent: :destroy
  validates :body, presence: true
  validates :body, length: { maximum: 250 }
end
