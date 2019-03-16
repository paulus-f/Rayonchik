# frozen_string_literal: true

class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index]

  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = suggestion.first(10)
  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
    @average = @suggestion.ratings&.average(:amount)
    if @average.nil?
      @average = 'Пока никто не оценил'
    end
  end

  # GET /suggestions/new
  def new
    @suggestion = suggestion.new
  end

  # GET /suggestions/1/edit
  def edit
    unless current_user.id == @suggestion.user.id
      redirect_to :root, danger: 'Нельзя' unless current_user.role.role_type
    end
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = suggestion.new(suggestion_params)
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

  def rate
    rate_par = rate_params
    @suggestion = Suggestion.where(id: rate_par[:active_suggestion_id]).last
    if @suggestion.nil?
      redirect_to :root, danger: 'Пост не найден :Q'
    else
      if Rating.where(active_suggestion_id: @suggestion.id, user_id: current_user.id).last.nil?
        @rating = current_user.ratings.new(rate_par)
        if @rating.save
          (redirect_to @suggestion, success: 'Успешно оценено')
        else
          (redirect_to @suggestion, danger: 'Упс... Что-то пошло не так')
        end
      else
        redirect_to active_suggestion_path(@suggestion), danger: 'Вы уже оценивали это предложение'
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_suggestion
    @suggestion = suggestion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def suggestion
    Suggestion.where(type: params[:type])
  end

  def rate_params
    params.permit(:amount, :active_suggestion_id)
  end

  def suggestion_params
    suggestion_type = case params[:type]
                      when 'ActiveSuggestion' then 'active_suggestion'
                      when 'ArchivedSuggestion' then 'archived_suggestion'
                      when 'PendingSuggestion' then 'panding_suggestion'
                      when 'VotingSuggestion' then 'voting_suggestion'
                      end
    params.require(suggestion_type).permit(:title, :image, :user_id, :region_id, :description)
  end
end
