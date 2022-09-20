# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Works', type: :request do
  let(:current_user) { create(:user) }

  before do
    authorization_stub
  end

  describe 'GET /work' do
    before do
      create_list(:work, 10, user_id: current_user.id)
      get '/api/v1/works'
    end

    it 'returns expected status' do
      expect(response).to have_http_status(:ok)
      assert_response_schema_confirm
    end

    it 'has expected responses' do
      expect(JSON.parse(response.body).length).to eq(10)
    end
  end
end
