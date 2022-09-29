# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  let(:current_user) { create(:user) }

  before do
    authorization_stub
  end

  describe 'GET /api/v1/user' do
    before do
      get api_v1_user_path
    end

    it 'returns expected status' do
      expect(response).to have_http_status(:ok)
      assert_response_schema_confirm
    end
  end

  describe 'PATCH /api/v1/user' do
    let(:headers) { { 'Content-Type' => 'application/json' } }

    context 'when update' do
      let(:params) { attributes_for(:user, id: current_user.id, target_amount: nil) }

      it 'can update' do
        params[:target_amount] = 100000
        patch api_v1_user_path, params: params.to_json, headers: headers
        expect(response).to have_http_status(:ok)
        expect(current_user.reload.target_amount).to eq 100000
        assert_request_schema_confirm
      end

      it 'cannot update with invalid params' do
        params[:target_amount] = 0
        patch api_v1_user_path, params: params.to_json, headers: headers
        expect(response).to have_http_status(:unprocessable_entity)
        expect(current_user.reload.target_amount).to be_nil
      end
    end
  end

  describe 'DELETE /api/v1/user' do
    context 'when delete' do
      it 'returns expected status' do
        delete api_v1_user_path
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
