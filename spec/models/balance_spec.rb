require 'spec_helper'

describe Balance, type: :model do
  let(:balance) { FactoryGirl.create(:balance, amount: 0, planned_amount: 0) }

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

  describe "planned amount" do
    xit "should be equal or less than amount" do
      balance.planned_amount = 0
      expect(balance).to be_valid

      balance.amount = 100
      balance.planned_amount = 50
      expect(balance).to be_valid
    end

    xit "add error when planned_amount more than amount" do
      balance.planned_amount = 50
      expect(balance).to_not be_valid
    end

    it "less than 0 should not be valid" do
      balance.planned_amount = -1
      expect(balance).to_not be_valid
    end
  end
end
