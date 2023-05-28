class Blargh < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_many :images, as: :imageable
  validates :body, presence: true
  validates :body, length: { maximum: 250 }
end
