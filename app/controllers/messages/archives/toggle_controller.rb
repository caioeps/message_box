module Messages
  module Archives
    class ToggleController < ApplicationController
      before_action :authenticate_user!

      def update
        @message = current_user.received_messages.find(params[:id])

        if @message.toggle_archive!
          head :ok
        else
          render json: @message.errors
        end
      end
    end
  end
end
