require 'rails_helper'

RSpec.describe Api::MessagesController, type: :controller do
  let(:user) { create(:user, :with_authentication_token) }

  before do
    api_sign_in user
  end

  describe "GET #index" do
    let!(:messages) { create_list(:message, 2, receiver: user) }

    subject { get :index }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'returns the users messages' do
      subject
      expect(json_response.size).to eq(2)
    end
  end

  describe '#show' do
    let!(:message) { create(:message, receiver: user) }

    subject { get :show, params: { id: message.id, format: 'json' } }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'render a message json' do
      subject

      expect(json_response)
        .to have_key('subject')
        .and have_key('body')
        .and have_key('id')
        .and have_key('created_at')
    end
  end

  describe "GET #create" do
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
      expect(response).to have_http_status(:success)
    end

    it 'creates a message' do
      expect { subject }.to change(Message, :count).by(1)
    end

    it 'renders a message json' do
      subject

      expect(json_response)
        .to have_key('id')
        .and have_key('subject')
        .and have_key('body')
        .and have_key('created_at')
    end
  end
end
