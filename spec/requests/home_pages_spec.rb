require 'spec_helper'

describe "Home pages" do 
  it do
    visit '/'
    expect(page).to have_content('Markup examples')
  end
end