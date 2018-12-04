module Api
  module Messages
    class SentsController < Api::BaseController
      def index
        @messages = UserMessagesFinder.new(user: current_user).sent.messages
        render json: @messages, each_serializer: ::Messages::IndexSerializer
      end
    end
  end
end
