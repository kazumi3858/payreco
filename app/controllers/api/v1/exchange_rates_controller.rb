# frozen_string_literal: true

module Api
  module V1
    class ExchangeRatesController < ApplicationController
      skip_before_action :authenticate
      before_action :authenticate_github_actions_token, only: :create

      def index
        exchange_rates = ExchangeRate.order(:created_at)
        render json: exchange_rates
      end

      def create
        return unless authenticate_github_actions_token

        exchange_rate = ExchangeRate.find_or_initialize_by(year_and_month: year_and_month)
        if exchange_rate.update(year_and_month: year_and_month, exchange_rate_list: ExchangeRate.data)
          render json: exchange_rate, status: :created
        else
          render json: exchange_rate.errors, status: :unprocessable_entity
        end
      end

      private

      def authenticate_github_actions_token
        authenticate_or_request_with_http_token do |token, _options|
          ActiveSupport::SecurityUtils.secure_compare(token, ENV.fetch('RAILS_API_CALL_TOKEN', nil))
        end
      end

      def year_and_month
        Time.zone.today.to_s.delete('-').slice(0..5).to_i
      end
    end
  end
end
