class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  belongs_to :role
  has_many :suggstions
  def admin?
    role.role_type == "admin" ? true : false
  end
end
