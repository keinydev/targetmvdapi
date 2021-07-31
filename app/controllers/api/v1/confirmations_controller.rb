module Api
  module V1
    class ConfirmationsController < DeviseTokenAuth::ConfirmationsController
      
      def show
        render json: {
          status: 200,
          message: "Your account has been confirmed"
        }
      end
    end
  end
end
