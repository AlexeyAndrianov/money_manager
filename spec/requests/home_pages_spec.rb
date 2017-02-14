require 'spec_helper'

describe "Home pages" do 
  it do
    visit '/'
    expect(page).to have_content('Email')
    expect(page).to have_content('Log in')
  end
end


 
