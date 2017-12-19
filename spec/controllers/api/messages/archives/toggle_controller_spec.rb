require 'rails_helper'

RSpec.describe Api::Messages::Archives::ToggleController, type: :controller do
  describe "GET #update" do
    let!(:user) { create(:user) }
    let!(:message) { create(:message, receiver: user) }

    subject { patch :update, params: { id: message.id} }

    before do
      api_sign_in user
    end

    it 'returns http status success' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'calls message.toggle_archive!' do
      expect_any_instance_of(Message).to receive(:toggle_archive!)
      subject
    end
  end
end
