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
    @message = Message.find(params[:id])

    render json: @message, status: :ok
  end

  def create
  end

  def new
    @message = Message.new
  end

  private

  def serialized_user_messages
    UserMessagesFinder.new(user: current_user).inbox.messages.map do |message|
      serializer = Messages::IndexSerializer.new(message)
      ActiveModelSerializers::Adapter.create(serializer).as_json
    end
  end
end
