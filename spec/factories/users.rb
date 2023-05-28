# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'testemail@website.com' }
    username { 'UserOne' }
    password { 'password' }
    password_confirmation { 'password' }
    first_name { 'John' }
    last_name { 'Doe' }
  end
end
