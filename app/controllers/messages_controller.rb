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

  def create
  end

  def new
    @message = Message.new
  end

  private

  def serialized_user_messages
    Message.includes(:sender).order(created_at: :desc).map do |message|
      serializer = Messages::IndexSerializer.new(message)
      ActiveModelSerializers::Adapter.create(serializer).as_json
    end
  end
end
