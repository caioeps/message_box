require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:email).of_type(:string) }
  it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }

  it { is_expected.to have_db_index(:email).unique(true) }
  it { is_expected.to have_db_index(:reset_password_token).unique(true) }

  it do
    is_expected
      .to have_many(:received_messages)
      .class_name('Message')
      .with_foreign_key(:receiver_id)
  end

  it do
    is_expected
      .to have_many(:sent_messages)
      .class_name('Message')
      .with_foreign_key(:sender_id)
  end
end
