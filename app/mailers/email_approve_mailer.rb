class EmailApproveMailer < ApplicationMailer
  default from: 'deamteamrubylab@gmail.com'
  def approve_invite(email, password, first_name)
    @password = password
    @email = email
    @first_name = first_name
    mail(
        subject: "Invite to Rayonchick", 
        to: @email
      )
  end
end