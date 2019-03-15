class User < ApplicationRecord

  scope :user, -> { where(role_type: 'user') }
  scope :admin, -> { where(role_type: 'admin') }

  scope :moderator, -> { where(role: 'moderator') }
  scope :administration, -> { where(role: 'administration') }

  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one :role
  has_many :suggstions
end
