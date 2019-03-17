class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user_data = params[:user]
    create_jwt
    redirect_to :root
  end

  def update
    super
  end

  private

  def create_jwt
    result = JsonWebToken.encode(
      user_email: @user_data[:email], 
      first_name: @user_data[:first_name],
      last_name: @user_data[:last_name],
    )
    jwt_token = Invite.create!(token: result, email: @user_data[:email])
  end
end 