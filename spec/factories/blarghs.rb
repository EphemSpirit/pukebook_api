FactoryBot.define do
  factory :blargh do
    author_id { create(:user).id }
    body { "Test blargh" }
  end
end
