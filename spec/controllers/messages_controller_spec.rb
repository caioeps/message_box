require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    subject { get :index }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let!(:message) { create(:message, receiver: user) }

    subject { get :show, params: { id: message.id } }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'the message is marked as read' do
      expect { subject }.to change { message.reload.read? }.from(false).to(true)
    end

    context 'when there is no offer matching the id' do
      let!(:message) { build_stubbed(:message) }

      it 'returns http not found' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "post #create" do
    let(:receiver_email) { 'email@email.com' }
    let!(:receiver) { create(:user, email: receiver_email) }

    let(:message_params) do
      {
        subject: 'Metting',
        receiver_email: receiver_email,
        body: 'Hello, there!'
      }
    end

    subject do
      post :create, params: {
        message: message_params
      }
    end

    it "returns http success" do
      subject
      expect(response).to have_http_status(:redirect)
    end

    it 'creates a new message' do
      expect { subject }.to change(Message, :count).by(1)
    end

    it 'redirects to MessagesController#index' do
      subject
      expect(response).to redirect_to(messages_path)
    end

    context 'with invalid params' do
      let(:message_params) do
        {
          subject: 'Metting',
          receiver_email: receiver_email,
        }
      end

      it 'does not create any message' do
        expect { subject }.not_to change(Message, :count)
      end
    end
  end

  describe "GET #new" do
    subject { get :new }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end
  end
end
