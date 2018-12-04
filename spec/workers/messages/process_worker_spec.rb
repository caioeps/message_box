require 'rails_helper'

RSpec.describe Messages::ProcessWorker, type: :worker do
  let(:message) { build_stubbed :message }

  before do
    allow(Message).to receive(:find).with(message.id).and_return(message)
    allow(message).to receive(:save)
  end

  subject { described_class.new.perform message.id }

  it 'removes bad words from the message' do
    expect(IgnoreCurseWords).to receive(:new).with(message).and_call_original
    expect_any_instance_of(IgnoreCurseWords).to receive(:call)
    expect(message).to receive(:save)
    expect { subject }.to change(message, :status).to('processed')
  end
end
