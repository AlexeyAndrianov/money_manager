require 'spec_helper'

describe Balance, type: :model do
  let(:balance) { FactoryGirl.create(:balance, amount: 0) }
  
  it { should belong_to(:user) }
  
  describe "money amount" do
    it "more or equal to 0 should be valid" do
      expect(balance).to be_valid
    end
    
    it "less than 0 should not be valid" do
      balance.amount = -100
      expect(balance).to_not be_valid
    end
  end
end
