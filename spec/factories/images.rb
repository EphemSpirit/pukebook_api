# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    imageable_id { '' }
    imageable_type { 'MyString' }
  end
end
