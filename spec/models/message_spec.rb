require 'rails_helper'

RSpec.describe Message, type: :model do
  it do
    is_expected
      .to have_db_column(:subject)
      .of_type(:string)
      .with_options(null: false, default: '')
  end

  it do
    is_expected
      .to have_db_column(:body)
      .of_type(:text)
      .with_options(null: false, default: '')
  end

  it { is_expected.to have_db_index(:sender_id) }
  it { is_expected.to have_db_index(:receiver_id) }
  it { is_expected.to have_db_index([:receiver_id, :sender_id]) }

  it { is_expected.to belong_to(:sender).class_name('User') }
  it { is_expected.to belong_to(:receiver).class_name('User') }

  describe '#archive!' do
    let(:message) { create(:message) }

    subject { message.archive! }

    it 'sets a timestamp to #archived_at' do
      expect { subject }.to change(message, :archived_at)
    end
  end

  describe '#archived?' do
    subject { message.archived? }

    context 'when message is archived' do
      let(:message) { build_stubbed(:message, :archived) }

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'when message is not archived' do
      let(:message) { build_stubbed(:message) }

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end
  end

  describe '#read!' do
    let(:message) { create(:message) }

    subject { message.read! }

    it 'sets a timestamp to #archived_at' do
      expect { subject }.to change(message, :read_at)
    end
  end

  describe '#read?' do
    subject { message.read? }

    context 'when message is read' do
      let(:message) { build_stubbed(:message, :read) }

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'when message is not read' do
      let(:message) { build_stubbed(:message) }

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end
  end
end
