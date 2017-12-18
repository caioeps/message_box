require 'rails_helper'

RSpec.describe Messages::ArchivesController, type: :controller do
  describe 'GET #index' do
    let!(:user) { create(:user) }
    let!(:message) { create(:message, :archived, receiver: user) }

    subject { get :index }

    before do
      sign_in user
    end

    it 'returns http status success' do
      subject
      expect(response).to have_http_status(:success)
    end

    context 'when format is json' do
      subject { get :index, params: { format: 'json' } }

      it 'returns http status success' do
        subject
        expect(response).to have_http_status(:success)
      end
    end
  end
end
