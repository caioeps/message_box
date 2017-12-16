class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all
  end

  def create
  end

  def new
  end
end
