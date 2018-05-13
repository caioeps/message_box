require 'rails_helper'

RSpec.describe MessageDecorator do
  describe '#truncated_body' do
    let(:body) { 'a' * 90 }
    let(:message) { build_stubbed(:message, body: body) }
    let(:decorated_message) { MessageDecorator.new message }

    subject { decorated_message.truncated_body }

    it 'truncates the message body' do
      expect(subject.size).to eq(80)
    end
  end
end
