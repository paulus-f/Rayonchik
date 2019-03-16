class VotesController < ApplicationController
  def index
    @suggestions = Suggestion.approving
  end
end
