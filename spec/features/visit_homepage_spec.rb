require 'rails_helper'

feature "Visit homepage" do
  scenario "Should show name of app" do
    visit root_path
    expect(page).to have_content "Neo's"
  end
end
