require 'rails_helper'

RSpec.describe MessageDecorator do
  let(:decorated_message) { build_stubbed(:message).decorate }

  describe '#truncated_body' do
    let(:body) { 'a' * 90 }
    let(:decorated_message) { build_stubbed(:message, body: body).decorate }

    subject { decorated_message.truncated_body }

    it 'truncates the message body' do
      expect(subject.size).to eq(80)
    end
  end

  describe '.inbox_table_headings' do
    let(:expected_array) { ['remetente', 'título', 'enviada em'] }

    subject { described_class.inbox_table_headings }

    it 'matches the expected_array' do
      expect(subject).to eq(expected_array)
    end
  end
end
