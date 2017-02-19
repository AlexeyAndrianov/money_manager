require 'rails_helper'

describe Charge, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:charge) { FactoryGirl.build(:charge, amount: 10, user: user) }

  it { should belong_to(:user) }

  describe "balance amount" do
    it "changing after creating new charge" do
      expect { charge.save }.to change { user.balance.amount }.from(0).to(10)
    end

    it "changing after deletion new charge" do
      charge.save
      expect { charge.destroy }.to change { user.balance.amount }.from(10).to(0)
    end
  end
end
