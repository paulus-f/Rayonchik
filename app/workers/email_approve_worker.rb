class EmailApproveWorker
  include Sidekiq::Worker

  def perform(email, password, first_name)
    EmailApproveMailer.approve_invite(email, password, first_name).deliver
  end
end
