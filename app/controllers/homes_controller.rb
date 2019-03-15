class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # GET /homes
  # GET /homes.json
  def index
    @suggestions = Suggestion.all
  end


  # GET /homes/new
  def edit
  end

end
