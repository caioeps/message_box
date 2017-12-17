class Messages::ArchivesController < ApplicationController
  layout 'mailbox'

  before_action :authenticate_user!

  def index
    @messages = serialized_user_archived_messages

    respond_to do |format|
      format.html
      format.json { render json: @messages }
    end
  end

  def create
    @message = Message.find(params[:id])
    @message.archive!
    head :ok
  end

  private

  def serialized_user_archived_messages
    UserMessagesFinder.new(user: current_user).archived.messages.map do |message|
      serializer = Messages::IndexSerializer.new(message)
      ActiveModelSerializers::Adapter.create(serializer).as_json
    end
  end
end
