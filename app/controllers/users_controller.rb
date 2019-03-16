class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.admin?
      @invites = Invite.all
    end
  end
end