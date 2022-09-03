# frozen_string_literal: true

module Api
  module V1
    class ExchangeRatesController < ApplicationController
      def index
        render json: ExchangeRate.all
      end
    end
  end
end
