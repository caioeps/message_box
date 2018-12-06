class UserMessagesFinder
  attr_reader :messages, :user

  def initialize(messages: Message.all, user:)
    @user = user
    @messages = messages.processed_status
                        .order(created_at: :desc)
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

  def all_from_user
    sent_messages = user.sent_messages
    received_messages = user.received_messages

    @messages = Message.from("(#{sent_messages.to_sql} UNION #{received_messages.to_sql}) AS messages")
  end
end
