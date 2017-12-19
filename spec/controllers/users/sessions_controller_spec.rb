require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  let!(:user) do
    create(:user,
           email: 'email@email.com',
           password: '123123',
           authentication_token: 'auth_token')
  end

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe '#create' do
    let(:params) do
      {
        user: {
          email: 'email@email.com',
          password: '123123'
        }
      }
    end

    context 'when format is json' do
      subject { post :create, params: params.merge(format: 'json') }

      it 'renders a json with use info' do
        subject

        expect(json_response)
          .to have_key('success')
          .and have_key('auth_token')
          .and have_key('email')
      end
    end

    context 'when format is json and params are invalid' do
      let(:params) do
        {
          user: {
            email: 'wrong@email.com',
            password: '123123'
          }
        }
      end

      subject { post :create, params: params.merge(format: 'json') }

      it 'render errors' do
        subject
        expect(json_response).to have_key('error')
      end
    end
  end
end
