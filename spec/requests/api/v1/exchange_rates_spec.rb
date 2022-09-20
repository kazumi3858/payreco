# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::ExchangeRates', type: :request do
  describe 'GET /exchange_rates' do
    before do
      create_list(:exchange_rate, 2)
      get '/api/v1/exchange_rates'
    end

    it 'success' do
      expect(response).to have_http_status :ok
      assert_response_schema_confirm
    end

    it 'has expected responses' do
      expect(JSON.parse(response.body).length).to eq(2)
    end
  end
end
