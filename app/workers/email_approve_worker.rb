class EmailApproveWorker
  include Sidekiq::Worker

  def perform(user_params)
    InviteMailer.invite(@student, @foundation, *info).deliver
  end
end
