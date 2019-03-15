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
    jwt_token = Invite.create!(token: SecureRandom.uuid)
    JsonWebToken.encode(user_data: @user_data, token: jwt_token.token)
  end
end 