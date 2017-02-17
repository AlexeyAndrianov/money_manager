require 'spec_helper'

describe "Balance" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:balance) { FactoryGirl.create(:balance, user: user) }

  describe 'authorized user' do
    before(:each) do 
      sign_in(user)
      visit '/'
    end

    it 'balance should be present ' do
      expect(page).to have_content('Balance: 100.0')
    end  

  end

   describe 'unauthorized user' do
     it "balance should not be present" do
       visit '/'
       expect(page).to have_content('You need to sign in or sign up before continuing.')
     end
   end

end
