require 'rails_helper'


# Specs in this file have access to a helper object that includes
# the AuthorsHelper. For example:
#
# describe AuthorsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AuthorsHelper, type: :helper do
  fixtures :all
  describe 'ensure my profile' do
    it 'ensures the user is viewing thier profile' do
      author = authors(:one)
      sign_in author
      expect(helper.ensure_my_profile?(author)).to eq(true)
    end
  end
end
