module Api
  module V1
    class TargetsController < ApplicationController

      before_action :authenticate_user!

      def index
        @targets = current_user.targets
      end

      def create
        @target = current_user.targets.build(target_params)
        if @target.save
          match = search_match(@target.radius, @target.latitude, @target.longitude, @target.topic_id)
          matched_user = {}
          match_conversation = {}
          
          if match.size > 0
            @conversation = set_conversation(current_user.id, match.first.user_id)

            matched_user = { id: match.first.user_id, email: User.find(match.first.user_id).email, gender: User.find(match.first.user_id).gender }

            match_conversation = { id: @conversation.id }            
          end

          @data = { target: @target, matched_user: matched_user, match_conversation: match_conversation}
        else
          render json: { errors: @target.errors }, status: :unprocessable_entity
        end
      end  

      def destroy
        target.destroy!
        head :no_content
      end 
      
      private

      def target_params
        params.require(:target).permit(:title, :radius, :latitude, :longitude, :topic_id)
      end

      def target
        @target = Target.find(params[:id])
      end

      def search_match(radius, latitude, longitude, topic_id)
        Target.within(
          radius,
          :units => :miles,
          :origin => [ latitude, longitude ]
        ).where(topic_id: topic_id).where.not(user_id: current_user.id)
      end

      def set_conversation(user_a, user_b)
        if Conversation.between(user_a, user_b).present?
          @conversation = Conversation.between(user_a, user_b).first
        else
          @conversation = Conversation.create!(user_a_id: user_a, user_b_id: user_b)
        end
      end
    end
  end
end
