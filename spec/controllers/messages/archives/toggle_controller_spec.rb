require 'rails_helper'

RSpec.describe Messages::Archives::ToggleController, type: :controller do
  describe 'PATCH #update' do
    let!(:user) { create(:user) }
    let!(:message) { create(:message, receiver: user) }

    subject { patch :update, params: { id: message.id} }

    before do
      sign_in user
    end

    it 'returns http status success' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'calls message.reindex!' do
      expect_any_instance_of(Message).to receive(:toggle_archive!)
      subject
    end
  end
end
