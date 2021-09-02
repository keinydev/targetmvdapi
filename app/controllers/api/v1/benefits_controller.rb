module Api
  module V1
    class BenefitsController < ApplicationController

      def index
        @benefits = Benefit.all 
        render json: @benefits
      end         
    end
  end
end
