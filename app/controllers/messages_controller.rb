class MessagesController < ApplicationController
  layout 'mailbox'

  before_action :authenticate_user!

  def index
    @messages = Message.all.as_json

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
end
