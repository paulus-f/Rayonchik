class Administration < ApplicationRecord
  belongs_to :city
  has_many :regions
  has_many :users
end
