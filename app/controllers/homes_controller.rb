# frozen_string_literal: true

class HomesController < ApplicationController
  # GET /homes
  # GET /homes.json
  def index
    @provinces = Province.all
    @suggestions = ActiveSuggestion.all
  end

  def cities
    render json: Province.where(name: city_params).cities.all
  end

  def administrations
    render json: City.where(name: administration_params).administrations.all
  end

  def regions
    render json: Administration.where(name: region_params).regions.all
  end

  #-----------------------------------------#
  private
  #-----------------------------------------#
  def administration_params
    params.require(:get).permit(:city)
  end

  def region_params
    params.require(:get).permit(:administration)
  end

  def city_params
    params.require(:get).permit(:province)
  end
end

