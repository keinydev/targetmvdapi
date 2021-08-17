module Api
  module V1
    class ResetPasswordsController < ApplicationController

      def index
        data = request.params
        render json: {
          'access-token': data['access-token'],
          'client': data['client'],
          'uid': data['uid']
        }
      end         
    end
  end
end
