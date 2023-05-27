require 'rails_helper'

RSpec.describe Api::V1::BlarghsController, type: :request do
  before(:each) do
    host! 'localhost:3000'
  end
  context "when grabbing index" do
    let(:user) { create(:user) }
    let!(:blargh) { create(:blargh, author_id: user.id) }
    describe "/users/:id/blarghs" do
      it "returns ok" do
        sign_in user
        get "/api/v1/users/#{user.id}/blarghs"

        expect(response).to have_http_status(:ok)

        binding.pry

        response = JSON.parse(response.body)
      end
    end
  end
end