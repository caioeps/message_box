class MessagesController < ApplicationController
  layout 'mailbox'

  before_action :authenticate_user!

  def index
    @messages = serialized_user_messages

    respond_to do |format|
      format.html
      format.json { render json: @messages }
    end
  end

  def show
    @message = UserMessagesFinder.new(user: current_user)
                                 .inbox
                                 .messages
                                 .find(params[:id])
    @message.read!

    render json: @message, status: :ok
  end

  def create
    create_message_status = CreateMessage
      .new(message_params: message_params, current_user: current_user)
      .call

    if create_message_status.created?
      redirect_to messages_path, notice: 'Mensagem criada!'
    else
      @message_form = create_message_status.message_form
      render :new
    end
  end

  def new
    @message_form = MessageForm.new(Message.new)
  end

  private

  def message_params
    params.require(:message).permit(:subject, :receiver_email, :body)
  end

  def serialized_user_messages
    UserMessagesFinder.new(user: current_user).inbox.messages.map do |message|
      serializer = Messages::IndexSerializer.new(message)
      ActiveModelSerializers::Adapter.create(serializer).as_json
    end
  end
end
