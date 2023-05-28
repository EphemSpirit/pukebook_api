require 'rails_helper'

RSpec.describe User, type: :model do
  context "when creating user" do
    let(:user) { build(:user) }
    describe "#save" do
      it "creates a user with valid info" do
        expect{ user.save }.to change(User, :count).by(1)
      end
    end
  end

  context "when errors" do
    let(:user) { build(:user) }
    describe "#save" do
      it "populates errors for bad inputs" do
        user.email = "test"
        user.first_name = ""
        user.last_name = ""
        user.username = ""

        expect{ user.save }.to change(User, :count).by(0)
        expect(user.errors).to_not be_empty
        expect(user.errors.full_messages).to eq(["Email is invalid", "First name can't be blank", "Last name can't be blank", "Username can't be blank"])
      end

      it "prevents duplicate usernames" do
        user.save
        new_user = User.new
        new_user.assign_attributes(user.attributes)
        new_user.password = "password"

        expect{ new_user.save }.to change(User, :count).by(0)
        expect(new_user.errors.full_messages).to eq(["Email has already been taken", "Username has already been taken"])
      end
    end
  end
end
