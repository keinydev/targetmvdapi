module Api
  module V1
    class MessagesController < ApplicationController

      before_action :authenticate_user!

      def index
        @pagy, @messages = pagy(conversation.messages, page: params[:page], items: Conversation::ITEMS_PER_PAGE)
      end

      def create
        @message = conversation.messages.build(message_params)
        @message.user = current_user
        if @message.save
          @message
        else
          render json: { errors: @message.errors }, status: :unprocessable_entity
        end
      end

      private 

      def message_params
        params.require(:message).permit(:body)
      end

      def conversation
        @conversation = Conversation.find(params[:conversation_id])
      end
    end
  end
end
