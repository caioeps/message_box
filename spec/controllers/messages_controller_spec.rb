require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe "GET #index" do
    subject { get :index }

    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
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
