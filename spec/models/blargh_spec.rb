require 'rails_helper'

RSpec.describe Blargh, type: :model do
  context "when creating a blargh" do
    let(:blargh) { build(:blargh) }
    describe "#save" do
      it "saves the record" do
        expect{ blargh.save }.to change(Blargh, :count).by(1)
      end
    end
  end

  context "when no body" do
    let(:blargh) { build(:blargh) }
    describe "#save" do
      it "doesn't persist" do
        blargh.body = ""
        expect{ blargh.save }.to change(Blargh, :count).by(0)
        expect(blargh.errors.full_messages).to eq(["Body can't be blank"])
      end
    end
  end
end
