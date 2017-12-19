module Api
  class MessagesController < Api::BaseController
    def index
      @messages = UserMessagesFinder.new(user: current_user).inbox.messages

      render json: @messages, each_serializer: Messages::IndexSerializer
    end

    def show
      @message = current_user.received_messages.find(params[:id])
      @message.read!

      render json: @message, status: :ok
    end

    def create
      create_message_status = CreateMessage
        .new(message_params: message_params, current_user: current_user)
        .call

      if create_message_status.created?
        render json: create_message_status.message, status: :ok
      else
        render json: create_message_status.message_form.errors, status: :unprocessable_entity
      end
    end

    private

    def message_params
      params.require(:message).permit(:subject, :receiver_email, :body)
    end
  end
end
