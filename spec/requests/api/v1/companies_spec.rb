# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Companies', type: :request do
  let(:current_user) { create(:user) }
  let(:headers) { { 'Content-Type' => 'application/json' } }
  let(:params) { attributes_for(:company) }

  before do
    authorization_stub
  end

  describe 'GET /api/v1/companies' do
    before do
      create_list(:company, 3, user_id: current_user.id)
      get api_v1_companies_path
    end

    it 'returns expected status' do
      assert_response_schema_confirm(200)
    end

    it 'has expected responses' do
      expect(JSON.parse(response.body).length).to eq(3)
    end
  end

  describe 'POST /api/v1/companies' do
    context 'when create' do
      it 'can post' do
        expect { post api_v1_companies_path, params: params.to_json, headers: }.to change(Company, :count).by(1)
        expect(response).to have_http_status(:created)
        assert_request_schema_confirm
      end

      it 'cannot post with invalid params' do
        params[:name] = ''
        expect { post api_v1_companies_path, params: params.to_json, headers: }.not_to change(Company, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /api/v1/companies/:id' do
    let(:company) { create(:company, name: 'current name', user_id: current_user.id) }

    context 'when update' do
      it 'can update' do
        params[:name] = 'a'
        patch api_v1_company_path(company.id), params: params.to_json, headers: headers
        expect(response).to have_http_status(:ok)
        expect(company.reload.name).to eq 'a'
        assert_request_schema_confirm
      end

      it 'cannot update with invalid params' do
        params[:name] = ''
        patch api_v1_company_path(company.id), params: params.to_json, headers: headers
        expect(response).to have_http_status(:unprocessable_entity)
        expect(company.reload.name).to eq 'current name'
      end
    end
  end

  describe 'DELETE /api/v1/companies/:id' do
    let(:company) { create(:company, user_id: current_user.id) }

    context 'when delete' do
      it 'returns expected status' do
        delete api_v1_company_path(company.id)
        expect(response).to have_http_status(:no_content)
        assert_request_schema_confirm
      end

      it 'updates deleted_at time stamp' do
        expect(company.deleted_at).to be_nil
        expect { delete api_v1_company_path(company.id) }.not_to change(Company, :count)
        expect(company.reload.deleted_at).to be_truthy
      end
    end
  end
end
