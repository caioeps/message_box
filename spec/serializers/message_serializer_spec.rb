require 'rails_helper'

RSpec.describe MessageSerializer, type: :serializer do
  let(:message) { build_stubbed(:message, :with_large_body) }
  let(:serializer) { described_class.new(message) }

  let(:serialization) do
    ActiveModelSerializers::Adapter.create(serializer).as_json
  end

  describe 'fields' do
    %i(id subject created_at).each do |field|
      it "contains ##{field}" do
        expect(serialization[field]).to be
      end
    end
  end

  context 'associations' do
    describe '#sender' do
      subject { serialization[:sender] }

      it 'serializes the sender' do
        expect(subject).to be
      end

      it 'uses the UserSerializer' do
        expect(UserSerializer).to receive(:new).twice
        subject
      end
    end

    describe '#receiver' do
      subject { serialization[:receiver] }

      it 'serializes the receiver' do
        expect(subject).to be
      end

      it 'uses the UserSerializer' do
        expect(UserSerializer).to receive(:new).twice
        subject
      end
    end
  end
end
