require 'rails_helper'

describe Plan, type: :model do
  let(:plan) { FactoryGirl.create(:plan, amount: 10) }

  it { should belong_to(:user)}
  it { should belong_to(:category)}

  describe "amount" do
    it "more or equal to 0 should be valid" do
      expect(plan).to be_valid
    end

    it "less than 0 should not be valid" do
      plan.amount = -10
      expect(plan).to_not be_valid
    end
  end

#  describe "plan dates" do
#   it "plan starting date should be valid " do
#      expect(plan.start_date).to be eq(Date.today)
#    end
#  end
end
