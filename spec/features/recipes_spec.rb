require 'rails_helper'

feature "Recipes" do
  after do
    Recipe::RECIPES.clear
  end

  scenario "Should show title recipe" do
    Recipe.create(title: "Avocado Smoothie")

    visit root_path

    expect(page).to have_content "Avocado Smoothie"
  end

  scenario "Should show second title recipe" do
    Recipe.create(title: "Cauliflower Soup")

    visit root_path

    expect(page).to have_content "Cauliflower Soup"
  end

  scenario "Should have multiple recipes" do
    Recipe.create(title: "Avocado Smoothie")
    Recipe.create(title: "Cauliflower Soup")

    visit root_path

    expect(page).to have_content "Avocado Smoothie"
    expect(page).to have_content "Cauliflower Soup"
  end
end
