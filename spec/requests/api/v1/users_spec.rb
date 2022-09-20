# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  let(:current_user) { create(:user) }

  before do
    authorization_stub
  end

  describe 'GET /user' do
    before do
      get '/api/v1/user'
    end

    it 'return expected status' do
      expect(response).to have_http_status :ok
      assert_response_schema_confirm(200)
    end
  end
end
