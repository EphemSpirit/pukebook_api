# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MiniBlargh, type: :model do
  context 'when creating a mini blargh' do
    let(:blargh) { create(:blargh) }
    let(:mini_blargh) { build(:mini_blargh, blargh_id: blargh.id, author_id: blargh.author.id) }
    describe '#save' do
      it 'saves the record' do
        expect { mini_blargh.save }.to change(MiniBlargh, :count).by(1)
      end
    end
  end

  context 'when no body' do
    let(:blargh) { create(:blargh) }
    let(:mini_blargh) { build(:mini_blargh, blargh_id: blargh.id, author_id: blargh.author.id) }
    describe '#save' do
      it "doesn't persist" do
        mini_blargh.body = ''
        expect { mini_blargh.save }.to change(MiniBlargh, :count).by(0)
        expect(mini_blargh.errors.full_messages).to eq(["Body can't be blank"])
      end
    end
  end
end
