module Api
  module V1
    class TargetsController < ApplicationController

      before_action :authenticate_user!

      def create
        target = current_user.targets.build(target_params)
        if target.save
          render json: { target: target, match_conversation: { id: 0 } }, status: :created
        else
          render json: { errors: target.errors }, status: :unprocessable_entity
        end
      end  
      
      private

      def target_params
        params.require(:target).permit(:title, :radius, :latitude, :longitude, :topic_id)
      end
    end
  end
end
