class CreateMessage
  def initialize(message_params:, current_user:)
    @message_params = message_params
    @current_user = current_user
  end

  def call
    OpenStruct.new(
      created?: !!create_message,
      message_form: message_form,
      message: message_form.model)
  end

  private

  def create_message
    message_form.save if message_form.validate(normalized_message_params)
  end

  def errors
    message_form.errors
  end

  def message_form
    @message_form ||= MessageForm.new(Message.new)
  end

  def normalized_message_params
    @message_params.merge!(sender_id: @current_user.id)
  end

  def valid_message?
    @valid_message ||= message_form.validate(@message_params)
  end
end
