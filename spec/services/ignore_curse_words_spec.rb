require 'rails_helper'

RSpec.describe IgnoreCurseWords do
  let(:message) { build_stubbed :message, body: body }

  let(:body) { 'Fuck off, dude.' }

  subject { described_class.new(message).call }

  it 'omits bad words' do
    subject
    expect(message.body).to eq '**** off, dude.'
  end
end
