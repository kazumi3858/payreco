# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Companies', type: :request do
  let(:current_user) { create(:user) }

  before do
    authorization_stub
  end

  describe 'GET /api/v1/companies' do
    before do
      create_list(:company, 3, user_id: current_user.id)
      get '/api/v1/companies'
    end

    it 'returns expected status' do
      expect(response).to have_http_status(:ok)
      assert_response_schema_confirm
    end

    it 'has expected responses' do
      expect(JSON.parse(response.body).length).to eq(3)
    end
  end

  describe 'POST /api/v1/companies' do
    let(:headers) { { 'Content-Type' => 'application/json' } }

    context 'when create' do
      let(:params) { attributes_for(:company).to_json }

      it 'returns expected status' do
        post '/api/v1/companies', params: params, headers: headers
        expect(response).to have_http_status(:created)
        assert_request_schema_confirm
      end
    end
  end

  describe 'PATCH /api/v1/companies/:id' do
    let(:headers) { { 'Content-Type' => 'application/json' } }

    context 'when update' do
      let(:params) { attributes_for(:company).to_json }

      it 'returns expected status' do
        company = create(:company, user_id: current_user.id)
        patch "/api/v1/companies/#{company.id}", params: params, headers: headers
        expect(response).to have_http_status(:ok)
        assert_request_schema_confirm
      end
    end
  end

  describe 'DELETE /api/v1/companies/:id' do
    let(:company) { create(:company, user_id: current_user.id) }

    context 'when delete' do
      it 'returns expected status' do
        delete "/api/v1/companies/#{company.id}"
        expect(response).to have_http_status(:no_content)
        assert_request_schema_confirm
      end

      it 'updates deleted_at time stamp' do
        expect(company.deleted_at).to be_nil
        delete "/api/v1/companies/#{company.id}"
        expect(company.reload.deleted_at).to be_truthy
      end
    end
  end
end
