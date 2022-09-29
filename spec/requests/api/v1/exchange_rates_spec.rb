# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::ExchangeRates', type: :request do
  before do
    exchange_rate_api_stub
  end

  describe 'GET /api/v1/exchange_rates' do
    before do
      api_token_stub
      create_list(:exchange_rate, 2)
      get api_v1_exchange_rates_path
    end

    it 'returns expected status' do
      expect(response).to have_http_status(:ok)
      assert_response_schema_confirm
    end

    it 'has expected responses' do
      expect(JSON.parse(response.body).length).to eq(2)
    end
  end

  describe 'POST /api/v1/exchange_rates' do
    context 'when create' do
      let(:params) { attributes_for(:exchange_rate).to_json }

      it 'can post' do
        headers = { 'Content-Type' => 'application/json' }
        api_token_stub
        expect { post api_v1_exchange_rates_path, params:, headers: }.to change(ExchangeRate, :count).by(1)
        expect(response).to have_http_status(:created)
        assert_request_schema_confirm
      end

      it 'cannot post with invalid token' do
        headers = { 'Content-Type' => 'application/json', 'Authorization' => 'invalid token' }
        expect { post api_v1_exchange_rates_path, params:, headers: }.not_to change(ExchangeRate, :count)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
