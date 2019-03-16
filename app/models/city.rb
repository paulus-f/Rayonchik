class City < ApplicationRecord
  belongs_to :province
  has_many :administrations
  has_many :regions
end
