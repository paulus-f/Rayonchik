class InviteMailer < ApplicationMailer
  default from: 'deamteamrubylab@gmail.com'
  def invite(user_params)
    @user_data = user_params 
    @JWT = create_jwt
    mail(
        subject: "Invite to Rayonchick", 
        to: "#{user_params[:email]}"
      )
  end

  def send_password(user_email, password)
    @password = password
    mail(
      subject: 'Cangratulation from Rayonchik',
      to: "#{user_email}"
    )
  end

  private

  def create_jwt
    jwt_token = @student.jwt_tokens.create!(token: SecureRandom.uuid)
    JsonWebToken.encode(user_data: @user_data, token: jwt_token.token)
  end
end