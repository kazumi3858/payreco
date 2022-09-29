# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Authentications', type: :request do
  let(:current_user) { create(:user) }

  before do
    authorization_stub
  end

  describe 'DELETE /api/v1/authentications/:id' do
    before do
      company = create(:company, user_id: current_user.id)
      create(:work, user_id: current_user.id, company_id: company.id)
    end

    context 'when delete' do
      it 'returns expected status' do
        delete api_v1_authentication_path(current_user.id)
        expect(response).to have_http_status(:no_content)
      end

      it 'deletes users data' do
        expect(current_user.companies.exists?).to be(true)
        expect(current_user.works.exists?).to be(true)
        expect { delete api_v1_authentication_path(current_user.id) }.to change(User, :count).by(-1)
        expect(current_user.companies.exists?).to be(false)
        expect(current_user.works.exists?).to be(false)
      end
    end
  end
end
