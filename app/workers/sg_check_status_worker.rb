require 'sidekiq-scheduler'

class SgCheckStatusWorker
  include Sidekiq::Worker

  def perform(*args)
    ActiveSuggestion.each do |suggestion|
      days = (Date.now.to_date - suggestion.created_at.to_date).to_i
      if days > 60
        suggestion.type = 'PendingSuggestion'
        suggestion.save
      end
    end
  end
end
