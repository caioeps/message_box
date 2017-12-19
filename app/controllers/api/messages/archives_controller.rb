module Api
  module Messages
    class ArchivesController < Api::BaseController
      def index
        @messages = UserMessagesFinder.new(user: current_user).archived.messages
        render json: @messages, each_serializer: ::Messages::IndexSerializer
      end
    end
  end
end
