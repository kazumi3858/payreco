# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  let(:current_user) { create(:user) }

  before do
    authorization_stub
  end

  describe 'GET /api/v1/user' do
    before do
      get '/api/v1/user'
    end

    it 'return expected status' do
      expect(response).to have_http_status :ok
      assert_response_schema_confirm
    end
  end

  describe 'PATCH /api/v1/user' do
    let(:headers) { { 'Content-Type' => 'application/json' } }

    context 'when update' do
      let(:params) { attributes_for(:user).to_json }

      it 'returns expected status' do
        patch '/api/v1/user', params: params, headers: headers
        expect(response).to have_http_status(:ok)
        assert_request_schema_confirm
      end
    end
  end

  describe 'DELETE /api/v1/user' do
    context 'when delete' do
      it 'returns expected status' do
        delete '/api/v1/user'
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
