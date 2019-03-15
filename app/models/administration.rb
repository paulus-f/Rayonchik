class Administration < ApplicationRecord
  belongs_to :city
  has_many :regions
end
