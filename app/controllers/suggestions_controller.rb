# frozen_string_literal: true

class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index]


  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = ActiveSuggestion.first(10)
  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show; end

  # GET /suggestions/new
  def new
    @suggestion = ActiveSuggestion.new
  end

  # GET /suggestions/1/edit
  def edit
    unless current_user.id == @post.user.id
      unless current_user.role.role_type
        redirect_to :root, danger: 'Нельзя'
      end
    end
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = ActiveSuggestion.new(suggestion_params)
    if @suggestion.save
      redirect_to @suggestion, success: 'Успешно созданно'
    else
      render :new, danger: 'Упс... Что-то пошло не так'
    end
  end

  # PATCH/PUT /suggestions/1
  # PATCH/PUT /suggestions/1.json
  def update
    if @suggestion.update_attributes(suggestion_params)
      redirect_to @suggestion, success: 'Успешно обновленно'
    else
      render :edit, danger: 'Упс... Что-то пошло не так'
    end
  end

  # DELETE /suggestions/1
  # DELETE /suggestions/1.json
  def destroy
    @suggestion.destroy
    redirect_to :root, success: 'Предложение удаленно'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def suggestion_params
    params.require(:suggestion).permit(:title, :image, :user_id, :region_id, :description)
  end
end
