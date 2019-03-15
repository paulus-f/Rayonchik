class HomesController < ApplicationController
  # GET /homes
  # GET /homes.json
  def index
    @suggestions = Suggestion.all
  end


  # GET /homes/new
  def edit
  end

end
