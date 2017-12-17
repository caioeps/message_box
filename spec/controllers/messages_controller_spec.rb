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
    subject { post :create, params: {} }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
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
