class Rate < ApplicationRecord
  belongs_to :active_suggestion
  belongs_to :user
end
