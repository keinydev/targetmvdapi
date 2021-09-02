module Api
  module V1
    class BenefitsController < ApplicationController

      def index
        @benefits = Benefit.all
      end         
    end
  end
end
