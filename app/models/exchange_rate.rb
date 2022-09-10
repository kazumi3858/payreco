# frozen_string_literal: true

class ExchangeRate < ApplicationRecord
  CURRENCY_NAMES = %w[円 米ドル ユーロ 英ポンド インドルピー 豪ドル
                      カナダドル ランド NZドル SGドル 人民元 スイスフラン].freeze

  def old_data?
    created_at < Time.zone.now.beginning_of_day
  end

  def self.data
    response = JSON.parse(call_api)
    rate = response['conversion_rates'].slice('JPY', 'USD', 'EUR', 'GBP', 'INR', 'AUD', 'CAD', 'ZAR', 'NZD',
                                              'SGD', 'CNY', 'CHF')
    rate.transform_keys!.with_index { |_key, index| CURRENCY_NAMES[index] }
  end

  def self.call_api
    url = "https://v6.exchangerate-api.com/v6/#{ENV.fetch('RATE_API_KEY', nil)}/latest/JPY"
    uri = URI(url)
    Net::HTTP.get(uri)
  end
end
