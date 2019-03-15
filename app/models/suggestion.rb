class Suggestion < ApplicationRecord
  has_one :hearing
  belongs_to :user
end
