# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Authentications', type: :request do
  let(:current_user) { create(:user) }

  before do
    authorization_stub
  end

  describe 'DELETE /api/v1/authentications/:id' do
    context 'when delete' do
      it 'returns expected status' do
        params_id = current_user.id
        delete "/api/v1/authentications/#{params_id}"
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
