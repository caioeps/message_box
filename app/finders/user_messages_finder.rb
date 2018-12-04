class UserMessagesFinder
  attr_reader :messages, :user

  def initialize(messages: Message.all, user:)
    @user = user
    @messages = messages.order(created_at: :desc)
                        .includes(:receiver, :sender)
  end

  def inbox
    @messages = @messages.merge(user.received_messages).not_archived
    self
  end

  def archived
    @messages = @messages.merge(user.received_messages).archived
    self
  end

  def sent
    @messages = @messages.merge(user.sent_messages)
    self
  end
end
