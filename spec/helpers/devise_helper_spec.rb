require 'rails_helper'

RSpec.describe DeviseHelper, type: :helper do
  let(:user) { build_stubbed(:user) }

  describe '#devise_error_messages!' do
    before do
      helper.send(:define_singleton_method, :resource) { }

      allow(helper)
        .to receive(:resource)
        .and_return(double(errors: double(full_messages: ['A message'], empty?: false)))
    end

    it 'renders the messages' do
      expect(helper.devise_error_messages!).to match('A message')
    end
  end
end
