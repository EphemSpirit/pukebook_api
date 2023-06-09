# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # ==== SOCIAL MEDIA USER ====
  # User will have relationships to other users via friendships
  # User will either be the inciator or the recevier of the friendship
  # User can send or recieve invitations for friendship
  # User can create posts and comments
  # User can also delete their _own_ posts/comments
  # User can like other users' posts/comments
  # User can login via email OR username
  # Will have a dashboard
  # will have a profile picture
  # photo albums??
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :first_name, :last_name, :email, :username, presence: true
  validates :email, :username, uniqueness: true

  has_many :blarghs, foreign_key: :author_id, dependent: :destroy
  has_many :mini_blarghs, foreign_key: :author_id, dependent: :destroy
end
