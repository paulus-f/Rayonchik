class User < ApplicationRecord

  scope :user, -> { where(role_type: 'user') }
  scope :admin, -> { where(role_type: 'admin') }

  scope :moderator, -> { where(role: 'moderator') }
  scope :administration, -> { where(role: 'administration') }
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  belongs_to :role
  has_and_belongs_to_many :votes
  belongs_to :administration
  has_many :suggstions
  has_many :suggestions
  has_many :ratings
  def admin?
    role.role_type == "admin" ? true : false
  end
end
