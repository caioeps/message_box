require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe "GET #index" do
    subject { get :index }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    let!(:message) { create(:message, receiver: user) }

    subject { get :show, params: { id: message.id } }

    before do
      sign_in user
    end

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
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
