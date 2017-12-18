module Messages
  module Archives
    class ToggleController < ApplicationController
      before_action :authenticate_user!

      def update
        @message = Message.find(params[:id])

        if @message.toggle_archive!
          head :ok
        else
          render json: @message.errors
        end
      end
    end
  end
end
