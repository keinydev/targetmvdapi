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
          @target
        else
          render json: { errors: @target.errors }, status: :unprocessable_entity
        end
      end  

      def destroy
        target.destroy
        head :no_content
      end 
      
      private

      def target_params
        params.require(:target).permit(:title, :radius, :latitude, :longitude, :topic_id)
      end

      def target
        @target = Target.find(params[:id])
      end
    end
  end
end
