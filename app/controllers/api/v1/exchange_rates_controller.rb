# frozen_string_literal: true

module Api
  module V1
    class ExchangeRatesController < ApplicationController
      skip_before_action :authenticate
      before_action :valid_token?, only: :create

      def index
        exchange_rates = ExchangeRate.order(:created_at)
        render json: exchange_rates
      end

      def create
        return unless valid_token?

        this_year_and_this_month = Time.zone.today.to_s.delete('-').slice(0..5).to_i
        exchange_rate = ExchangeRate.find_or_initialize_by(year_and_month: this_year_and_this_month)
        if exchange_rate.update(year_and_month: this_year_and_this_month, exchange_rate_list: ExchangeRate.data)
          render json: exchange_rate
        else
          render json: exchange_rate.errors, status: :unprocessable_entity
        end
      end

      private

      def valid_token?
        ENV['RAILS_API_CALL_TOKEN'] == params[:token]
      end
    end
  end
end
