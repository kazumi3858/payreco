# frozen_string_literal: true

module AuthorizationHelper
  EXCHANGE_RATE_JSON = { conversion_rates: { JPY: 2, AUD: 0.01041, EUR: 0.01249, CHF: 0.006737, CAD: 6.4284,
                                             CNY: 0.04887, EGP: 0.1352, GBP: 0.006114, INR: 0.01978, HKD: 0.05481,
                                             HRK: 0.05254, MWK: 7.2214, NZD: 0.01173, SDG: 3.9553, SEK: 0.07530,
                                             SGD: 0.009833, SZL: 0.1235, USD: 0.006980, ZAR: 0.1235 } }.to_json

  def authorization_stub
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user) # rubocop:disable RSpec/AnyInstance
  end

  def exchange_rate_api_stub
    allow(ExchangeRate).to receive(:call_api).and_return(EXCHANGE_RATE_JSON)
  end

  def api_token_stub
    allow_any_instance_of(Api::V1::ExchangeRatesController).to receive(:valid_token?).and_return(true) # rubocop:disable RSpec/AnyInstance
  end
end
