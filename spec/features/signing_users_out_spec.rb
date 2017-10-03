require 'rails_helper'

RSpec.feature "While a user signs out" do
    before do
        @john = User.create!(email: 'john@example.com', password: 'password')
        visit '/'
        click_link "Sign in"
        fill_in "Email", with: @john.email
        fill_in "Password", with: @john.password
        click_button "Log in"
    end
  
    scenario "we should see 'signed out successfully' and the Sign Out button" do
        visit "/"
        click_link "Sign out"
        expect(page).to have_content('Signed out successfully.')
        expect(page).not_to have_content('Sign out')
    end
    
  
 end
  
