module Api
  module V1
    class ConversationsController < ApplicationController
      
      before_action :authenticate_user!

      def index
        @conversations = Conversation.by_user(current_user.id)
      end
    end
  end
end
