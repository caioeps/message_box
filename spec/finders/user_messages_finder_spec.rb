require 'rails_helper'

RSpec.describe UserMessagesFinder, type: :finder do
  let(:receiver) { create(:user) }

  describe '#messages' do
    let!(:message) { create(:message, receiver: receiver) }
    let!(:archived_message) { create(:message, :archived, receiver: receiver) }

    subject { described_class.new(user: receiver).messages }

    it 'returns all of the users received messages' do
      expect(subject).to include(message, archived_message)
    end
  end

  describe '#inbox' do
    let!(:message) { create(:message, receiver: receiver) }
    let!(:archived_message) { create(:message, :archived, receiver: receiver) }

    subject { described_class.new(user: receiver).inbox.messages }

    it 'returns only non archived messages' do
      expect(subject).to contain_exactly(message)
    end
  end

  describe '#archived' do
    let!(:message) { create(:message, receiver: receiver) }
    let!(:archived_message) { create(:message, :archived, receiver: receiver) }

    subject { described_class.new(user: receiver).archived.messages }

    it 'returns only archived messages' do
      expect(subject).to contain_exactly(archived_message)
    end
  end
end
