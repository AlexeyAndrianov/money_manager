require 'rails_helper'

describe PlanCharge, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let!(:balance) { FactoryGirl.create(:balance, user: user, amount: 100, planned_amount: 0) }
  let(:plan) { FactoryGirl.create(:plan, user: user) }
  let(:plan_charge) { FactoryGirl.create(:plan_charge, user: user, plan: plan, amount: 1) }

  it { should belong_to(:user) }
  it { should belong_to(:plan) }

  describe "Plan charge amount" do
    it "more or equal to 0 should be valid" do
      expect(plan_charge).to be_valid
    end
  end

  describe "callbacks" do
    it "after commit should update balance planned amount" do
      balance = plan_charge.user.balance

      expect{ plan_charge.run_callbacks(:commit) }.to change{ balance.planned_amount }.from(0).to(1)
    end
  end
end
