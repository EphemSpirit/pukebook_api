# frozen_string_literal: true

FactoryBot.define do
  factory :mini_blargh do
    body { 'MyText' }
    author_id { create(:user).id }
    blargh_id { create(:blargh).id }
  end
end
