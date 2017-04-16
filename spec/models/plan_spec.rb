require 'rails_helper'

describe Plan, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let!(:balance) { FactoryGirl.create(:balance, user: user, amount: 100, planned_amount: 100) }
  let(:plan) { FactoryGirl.create(:plan, user: user, amount: 10, status: :active) }
  let(:completed_plan) { FactoryGirl.create(:plan, amount: 10, status: :completed) }

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

  describe "callbacks" do
    it "reduce_balance_after_completion reducing balance amount" do
      expect { plan.run_callbacks(:destroy) }.to change{ balance.planned_amount }.from(100).to(90)
      expect { completed_plan.run_callbacks(:destroy) }.not_to change{ balance.planned_amount }
    end
  end
end
