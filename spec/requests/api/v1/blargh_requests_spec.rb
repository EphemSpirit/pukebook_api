# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe Api::V1::BlarghsController, type: :request do
  before(:each) do
    host! 'localhost:3000'
  end
  context 'when grabbing index' do
    let(:user) { create(:user) }
    let!(:blargh) { create(:blargh, author_id: user.id) }
    describe 'GET /users/:id/blarghs' do
      it 'returns ok' do
        sign_in user
        get '/api/v1/blarghs'
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'when creating a blargh' do
    let(:user) { create(:user) }
    describe 'POST /users/:id/blarghs' do
      it 'returns 201' do
        sign_in user

        params = {
          blargh: {
            author_id: user.id,
            body: 'test blargh'
          }
        }

        post "/api/v1/users/#{user.id}/blarghs", params: params, headers: { Authorization: "Bearer #{user.jti}" }

        expect(JSON.parse(response.body)['status']).to eq('created')
      end

      it 'returns unprocessable when bad params' do
        sign_in user
        params = {
          blargh: {
            author_id: user.id,
            body: ''
          }
        }

        post "/api/v1/users/#{user.id}/blarghs", params: params, headers: { Authorization: "Bearer #{user.jti}" }

        expect(JSON.parse(response.body)['status']).to eq('unprocessable_entity')
      end
    end
  end

  context 'when deleting a blargh' do
    let(:user) { create(:user) }
    let!(:blargh) { create(:blargh, author_id: user.id) }
    describe 'DELETE /api/v1/users/:id/blargh/:id' do
      it 'returns no content' do
        sign_in user
        delete "/api/v1//users/#{user.id}/blarghs/#{blargh.id}", headers: { Authorization: "Bearer #{user.jti}" }
        expect(JSON.parse(response.body)['status']).to eq('no_content')
      end
    end
  end
end
