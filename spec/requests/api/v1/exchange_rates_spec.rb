# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::ExchangeRates', type: :request do
  before do
    exchange_rate_api_stub
    api_token_stub
  end

  describe 'GET /api/v1/exchange_rates' do
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

  describe 'POST /api/v1/exchange_rates' do
    let(:headers) { { 'Content-Type' => 'application/json' } }

    context 'when create' do
      let(:params) { attributes_for(:exchange_rate).to_json }

      it 'returns expected status' do
        post '/api/v1/exchange_rates', params: params, headers: headers
        expect(response).to have_http_status(:created)
        assert_request_schema_confirm
      end
    end
  end
end
