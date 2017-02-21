require 'spec_helper'

describe "Charges pages" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category, user: user) }
  let!(:charge) { FactoryGirl.create(:charge, user: user) }

  before do
    sign_in user
    visit charges_path
  end

  it { page.should have_link('New Charge', href: new_charge_path) }
end

describe "Creating a new charge" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category, user: user) }
  let!(:charge) { FactoryGirl.create(:charge, user: user) }
  before do
    sign_in user
    visit new_charge_path
  end
  it { page.should have_content('Amount')}
  it { page.should have_content('Description')}
  it { page.should have_content('Operation date')}
end