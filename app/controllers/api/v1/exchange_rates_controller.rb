# frozen_string_literal: true

require 'net/http'
require 'json'

module Api
  module V1
    class ExchangeRatesController < ApplicationController
      CURRENCY_NAMES = %w[円 米ドル ユーロ 英ポンド インドルピー 豪ドル
                          カナダドル ランド NZドル SGドル 人民元 スイスフラン].freeze

      def index
        exchange_rates = ExchangeRate.order(:created_at)
        create_or_update_todays_rate if exchange_rates.empty? || exchange_rates.last.old_data?
        render json: exchange_rates
      end

      def create_or_update_todays_rate
        exchange_rate = ExchangeRate.find_or_initialize_by(year_and_month: this_year_and_this_month)
        exchange_rate.update(year_and_month: this_year_and_this_month, exchange_rate_list: rate_data)
      end

      private

      def rate_data
        url = "https://v6.exchangerate-api.com/v6/#{ENV.fetch('RATE_API_KEY', nil)}/latest/JPY"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        response_obj = JSON.parse(response)
        rate = response_obj['conversion_rates'].slice('JPY', 'USD', 'EUR', 'GBP', 'INR', 'AUD', 'CAD', 'ZAR', 'NZD',
                                                      'SGD', 'CNY', 'CHF')
        rate.transform_keys!.with_index { |_key, index| CURRENCY_NAMES[index] }
      end

      def this_year_and_this_month
        Time.zone.today.to_s.delete('-').slice(0..5).to_i
      end
    end
  end
end
