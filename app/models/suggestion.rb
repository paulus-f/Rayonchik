class Suggestion < ApplicationRecord
  has_one :hearing
  belongs_to :region
  belongs_to :user
  has_many :votes
  belongs_to :region
  scope :approving, -> { where(approve: true) }
  def can_vote(current_user)
    votes.where(user_id: current_user.id).nil? == [] ? true : false
  end
end
