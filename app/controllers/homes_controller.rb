class HomesController < ApplicationController
  # GET /homes
  # GET /homes.json
  def index
    @cities = City.all
  end



  # GET /homes/new
  def edit
  end

end
