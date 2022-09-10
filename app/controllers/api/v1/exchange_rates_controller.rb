# frozen_string_literal: true

require 'net/http'
require 'json'

module Api
  module V1
    class ExchangeRatesController < ApplicationController
      def index
        exchange_rates = ExchangeRate.order(:created_at)
        create_or_update_todays_rate if exchange_rates.empty? || exchange_rates.last.old_data?
        render json: exchange_rates
      end

      def create_or_update_todays_rate
        this_year_and_this_month = Time.zone.today.to_s.delete('-').slice(0..5).to_i
        exchange_rate = ExchangeRate.find_or_initialize_by(year_and_month: this_year_and_this_month)
        exchange_rate.update(year_and_month: this_year_and_this_month, exchange_rate_list: ExchangeRate.data)
      end
    end
  end
end
