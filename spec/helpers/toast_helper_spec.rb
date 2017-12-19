require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ToastHelper. For example:
#
# describe ToastHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ToastHelper, type: :helper do
  before do
    allow(helper).to receive(:flash).and_return([
      [:alert, 'hi!'],
      [:notice, 'hi!'],
    ])
  end

  describe '#show_flash_messages' do
    subject { helper.show_flash_messages }

    it 'returns the flash messages as span tags so materialize can fetch them' do
      expect(subject).to eq('<span style="display:none" class="flash-message">hi!</span><span style="display:none" class="flash-message">hi!</span>')
    end
  end
end
