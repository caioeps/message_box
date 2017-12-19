require 'rails_helper'

RSpec.describe Api::Messages::ArchivesController, type: :controller do
  let!(:user) { create(:user) }

  before do
    api_sign_in user
  end

  describe "GET #index" do
    let!(:messages) { create_list(:message, 2, :archived, receiver: user) }
    let!(:non_archived_message) { create(:message, receiver: user) }

    subject { get :index }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'render the messages' do
      subject
      expect(json_response.size).to eq(2)
    end

    it 'renders only archived messages' do
      subject
      expect(response.body)
        .not_to match("\"id\":\"#{non_archived_message.id}\"")
    end
  end
end
