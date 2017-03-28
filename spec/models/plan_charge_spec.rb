require 'rails_helper'

describe PlanCharge, type: :model do
  let(:plan_charge) { FactoryGirl.create(:plan_charge, amount: 1) }

  it { should belong_to(:user) }
  it { should belong_to(:plan) }

  describe "Plan charge amount" do
    it "more or equal to 0 should be valid" do
      expect(plan_charge.amount).to be_valid
    end
  end
end
