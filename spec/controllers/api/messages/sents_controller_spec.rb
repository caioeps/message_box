require 'rails_helper'

RSpec.describe Api::Messages::SentsController, type: :controller do
  let!(:user) { create(:user) }

  before do
    api_sign_in user
  end

  describe 'GET #index' do
    let!(:messages) { create_list(:message, 2, :archived, receiver: user) }
    let!(:sent_message) { create(:message, sender: user) }

    subject { get :index }

    it 'returns http success' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'render the messages' do
      subject
      expect(json_response.size).to eq(1)
    end

    it 'renders only archived messages' do
      subject
      expect(response.body)
        .not_to match("\"id\":\"#{sent_message.id}\"")
    end
  end
end
