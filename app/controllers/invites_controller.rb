class InvitesController < ApplicationController
  before_action :authenticate_user!

  def approve
    password =  Devise.friendly_token
    invite = Invite.find_by(id: params[:id])
    @data = JsonWebToken.decode(invite.token)
    @user = User.new(
        email: @data["user_email"],
        password: password,
        first_name: @data["first_name"], 
        last_name: @data["last_name"],
        confirmed_at: Time.now,
        role: Role.find_by(role_type: "user")
      )
    @user.save!
    invite.destroy
    EmailApproveWorker.perform_async(@user.email, password, @user.first_name)
  end

  def destroy
    @invite = Invite.find_by(id: params[:id])
    @invite.destroy
    redirect_to  current_user
  end

end