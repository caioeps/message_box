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

  pending '#archived?'

  pending '#read!'

  pending '#read?'
end
