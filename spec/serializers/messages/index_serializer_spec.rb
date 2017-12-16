require 'rails_helper'

RSpec.describe Messages::IndexSerializer, type: :serializer do
  let(:message) { build_stubbed(:message, :with_large_body) }
  let(:serializer) { described_class.new(message) }

  let(:serialization) do
    ActiveModelSerializers::Adapter.create(serializer).as_json
  end

  describe 'fields' do
    %i(id subject body created_at).each do |field|
      it "contains ##{field}" do
        expect(serialization[field]).to be
      end
    end
  end

  describe '#body' do
    subject { serialization[:body] }

    it 'truncates de message body' do
      expect(subject).to be < message.body
    end

    it 'uses MessageDecorator#truncated_body to truncate the message body' do
      expect_any_instance_of(MessageDecorator)
        .to receive(:truncated_body)
        .and_return('truncated body')

      expect(subject).to eq('truncated body')
    end
  end
end
