require 'rails_helper'

RSpec.describe CreateMessage do
  let!(:user) { create(:user, email: receiver_email) }
  let(:receiver_email) { 'email@email.com' }

  let(:params) do
    {
      subject: 'Meeting up @ 5PM',
      receiver_email: receiver_email,
      body: "Meet me at Moe's by 5PM or you're gonna get fired."
    }
  end

  subject do
    described_class.new(message_params: params, current_user: user).call
  end

  context 'with valid params' do
    it 'creates a new message' do
      expect { subject }.to change { Message.count }.by(1)
    end

    it 'tells that the message was created' do
      expect(subject.created?).to eq(true)
    end

    it 'returns the message created' do
      expect(subject.message).to be_a(Message)
    end

    it 'returns the message form' do
      expect(subject.message_form).to be_a(MessageForm)
    end
  end

  context 'with invalid params' do
    before do
      allow_any_instance_of(MessageForm).to receive(:validate).and_return(false)
    end

    it 'does not create any message' do
      expect { subject }.not_to change(Message, :count)
    end

    it 'tells that the message was not created' do
      expect(subject.created?).to eq(false)
    end

    it 'returns the message form so we can render the errors' do
      expect(subject.message_form).to be_a MessageForm
    end
  end
end
