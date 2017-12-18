require 'rails_helper'

RSpec.describe MessageForm, type: :form do
  let(:message) { Message.new }
  let(:form) { described_class.new(message) }
  let(:receiver_email) { 'email@email.com' }
  let!(:sender) { create(:user) }

  describe 'valitations' do
    subject { form.validate(params) }

    let(:params) do
      {
        subject: 'Meeting up @ 5PM',
        receiver_email: receiver_email,
        sender_id: sender&.id,
        body: "Meet me at Moe's by 5PM or you're gonna get fired."
      }
    end

    context 'with valid params' do
      let!(:user) { create(:user, email: receiver_email) }

      it 'returns no errors' do
        expect(subject).to eq(true)
      end

      it 'assigns receiver_id' do
        expect { subject }.to change(form, :receiver_id).from(nil).to(user.id)
      end
    end

    context 'when user does not exist' do
      it 'returns errors' do
        expect(subject).to eq(false)
      end
    end

    context 'when the message subject is blank' do
      let(:params) do
        {
          receiver_email: receiver_email,
          sender_id: sender&.id,
          body: "Meet me at Moe's by 5PM or you're gonna get fired."
        }
      end

      it 'returns errors' do
        expect(subject).to eq(false)
      end
    end

    context 'when the message receiver_email is blank' do
      let(:params) do
        {
          subject: 'Meeting up @ 5PM',
          sender_id: sender&.id,
          body: "Meet me at Moe's by 5PM or you're gonna get fired."
        }
      end

      it 'returns errors' do
        expect(subject).to eq(false)
      end
    end

    context 'when the message body is blank' do
      let(:params) do
        {
          subject: 'Meeting up @ 5PM',
          sender_id: sender&.id,
          receiver_email: receiver_email,
        }
      end

      it 'returns errors' do
        expect(subject).to eq(false)
      end
    end
  end
end
