require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:email).of_type(:string) }
  it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }

  it { is_expected.to have_db_index(:email).unique(true) }
  it { is_expected.to have_db_index(:reset_password_token).unique(true) }
end
