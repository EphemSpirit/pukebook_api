# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :imagebale, polymorphic: true
end
