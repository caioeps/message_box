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
end
