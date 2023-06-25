# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::MiniBlarghsController, type: :request do
  before(:each) do
    host! 'localhost:3000'
  end
  context 'when creating a mini blargh' do
    let(:user) { create(:user) }
    let!(:blargh) { create(:blargh, author_id: user.id) }

    describe 'POST /api/v1/blarghs/:blargh_id/mini_blarghs' do
      it 'returns created' do
        params = {
          mini_blargh: {
            author_id: user.id,
            blargh_id: blargh.id,
            body: 'test mni blargh'
          }
        }

        sign_in user

        post "/api/v1/users/#{user.id}/blarghs/#{blargh.id}/mini_blarghs", params: params, headers: { Authorization: "Bearer #{user.jti}" }

        expect(JSON.parse(response.body)['status']).to eq('created')
      end
    end
  end

  context 'when deleting' do
    let(:user) { create(:user) }
    let(:blargh) { create(:blargh, author_id: user.id) }
    let!(:mini_blargh) { create(:mini_blargh, author_id: user.id, blargh_id: blargh.id) }
    describe 'DELETE /api/v1/blarghs/:blargh_id/mini_blarghs/:id' do
      it 'returns no content' do
        sign_in user

        delete "/api/v1/users/#{user.id}/blarghs/#{blargh.id}/mini_blarghs/#{mini_blargh.id}", headers: { Authorization: "Bearer #{user.jti}" }

        expect(JSON.parse(response.body)['status']).to eq('no_content')
      end
    end
  end
end
