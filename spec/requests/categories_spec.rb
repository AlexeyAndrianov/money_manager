require 'spec_helper'

describe "Categories pages" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category, user: user) }

  describe 'authorized user' do
    before(:each) do 
      sign_in(user)
      visit '/categories'
    end


    it do
      expect(page).to have_content('New category')
    end  

    it do
      expect(page).to have_content('ALL CATEGORIES LIST')
    end 

    it do
      expect(page).to have_content('Edit')
      expect(page).to have_content('Destroy')      
      expect(page).to have_content('Show')
    end 
  end

  describe 'unauthorized user' do
    it "redirects to home page" do
      visit '/categories'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    it "Sign in form" do
      visit '/categories'
      expect(page).to have_content('Log in')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Remember me')
    end
  end

end
