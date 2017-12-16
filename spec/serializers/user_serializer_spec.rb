require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  let(:user) { build_stubbed(:user) }
  let(:serializer) { described_class.new(user) }

  let(:serialization) do
    ActiveModelSerializers::Adapter.create(serializer).as_json
  end

  describe 'fields' do
    %i(id email).each do |field|
      it "contains ##{field}" do
        expect(serialization[field]).to be
      end
    end
  end
end
