class Image < ApplicationRecord
    belongs_to :imagebale, polymorphic: true
end
