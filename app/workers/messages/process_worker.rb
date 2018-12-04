module Messages
  class ProcessWorker
    include Sidekiq::Worker

    def perform(message_id)
      message = Message.find message_id
      IgnoreCurseWords.new(message).call
      message.status = :processed
      message.save
    end
  end
end
