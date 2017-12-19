class UserMessagesFinder
  attr_reader :messages

  def initialize(messages: Message.all, user:)
    @user = user
    @messages = @user.received_messages
                     .order(created_at: :desc)
                     .includes(:receiver, :sender)
  end

  def inbox
    @messages = @messages.not_archived
    self
  end

  def archived
    @messages = @messages.archived
    self
  end
end
