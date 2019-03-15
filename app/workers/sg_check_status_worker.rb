
require 'sidekiq-scheduler'

class SgCheckStatusWorker
  include Sidekiq::Worker

  def perform(*args)
    User.all
  end
end
