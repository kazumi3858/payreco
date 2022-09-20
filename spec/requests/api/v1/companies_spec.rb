# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Companies', type: :request do
  let(:current_user) { create(:user) }

  before do
    authorization_stub
  end

  describe 'GET /company' do
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
end
