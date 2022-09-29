# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Works', type: :request do
  let(:current_user) { create(:user) }
  let(:company) { create(:company) }
  let(:headers) { { 'Content-Type' => 'application/json' } }
  let(:params) { attributes_for(:work, user_id: current_user.id, company_id: company.id) }

  before do
    authorization_stub
  end

  describe 'GET /work' do
    before do
      create_list(:work, 10, user_id: current_user.id)
      get api_v1_works_path
    end

    it 'returns expected status' do
      assert_response_schema_confirm(200)
    end

    it 'has expected responses' do
      expect(JSON.parse(response.body).length).to eq(10)
    end
  end

  describe 'POST /api/v1/works' do
    context 'when create' do
      it 'can post' do
        expect { post api_v1_works_path, params: params.to_json, headers: }.to change(Work, :count).by(1)
        expect(response).to have_http_status(:created)
        assert_request_schema_confirm
      end

      it 'cannot post with invalid params' do
        params[:working_hours] = 0.0
        expect { post api_v1_works_path, params: params.to_json, headers: }.not_to change(Work, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /api/v1/works/:id' do
    let(:work) { create(:work, working_hours: 8.0, user_id: current_user.id) }

    context 'when update' do
      it 'can update' do
        params[:working_hours] = 0.01
        patch api_v1_work_path(work.id), params: params.to_json, headers: headers
        expect(response).to have_http_status(:ok)
        expect(work.reload.working_hours).to eq 0.01
        assert_request_schema_confirm
      end

      it 'cannot update with invalid params' do
        params[:working_hours] = 0.0
        patch api_v1_work_path(work.id), params: params.to_json, headers: headers
        expect(response).to have_http_status(:unprocessable_entity)
        expect(work.reload.working_hours).to eq 8.0
      end
    end
  end

  describe 'DELETE /api/v1/works/:id' do
    context 'when delete' do
      it 'returns expected status' do
        work = create(:work, user_id: current_user.id)
        expect { delete api_v1_work_path(work.id) }.to change(Work, :count).by(-1)
        expect(response).to have_http_status(:no_content)
        assert_request_schema_confirm
      end
    end
  end
end
