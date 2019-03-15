class Region < ApplicationRecord
  belongs_to :administration
  has_many :users
end
