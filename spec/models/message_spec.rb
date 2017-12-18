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

  describe '.archived' do
    let!(:message) { create(:message) }
    let!(:archived_message) { create(:message, :archived) }

    subject { described_class.archived }

    it 'contains only archived messages' do
      expect(subject).to contain_exactly(archived_message)
    end
  end

  describe '.not_archived' do
    let!(:message) { create(:message) }
    let!(:archived_message) { create(:message, :archived) }

    subject { described_class.not_archived }

    it 'contains only archived messages' do
      expect(subject).to contain_exactly(message)
    end
  end

  describe '.read' do
    let!(:message) { create(:message) }
    let!(:read_message) { create(:message, :read) }

    subject { described_class.read }

    it 'contains only archived messages' do
      expect(subject).to contain_exactly(read_message)
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

  describe '#toggle_archive!' do
    subject { message.toggle_archive! }

    context 'when message is not archived' do
      let(:message) { create(:message) }

      it 'sets a timestamp to #archived_at' do
        expect { subject }.to change { message.reload.archived_at }
      end
    end

    context 'when message is archived' do
      let(:message) { create(:message, :archived) }

      it 'sets #archived_at to nil' do
        expect { subject }.to change { message.reload.archived_at }.to(nil)
      end
    end
  end
end
