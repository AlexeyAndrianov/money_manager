require 'spec_helper'

describe "Charges pages" do
  before do
    sign_in user
  end
  let(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category, user: user) }
  let!(:charge) { FactoryGirl.create(:charge, user: user) }

  describe "All charges page" do
    before do
      visit charges_path
    end
    it { page.should have_link('New Charge', href: new_charge_path) }
  end

  describe "New charge page" do
    before do
      visit new_charge_path
    end
    it { page.should have_content('Amount')}
    it { page.should have_content('Description')}
    it { page.should have_content('Operation date')}
  end
end