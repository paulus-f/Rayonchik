class AdministrationsController < ApplicationController
  def show
    @administartion = Administration.find_by(id: params[:id])
    @city = @administartion.city
    if current_user.admin?
      @suggestions = Suggestion.all
    end
  end
end