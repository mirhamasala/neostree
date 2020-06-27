require 'spec_helper'
require './app/models/recipe'

RSpec.describe Recipe do
  after do
    Recipe::RECIPES.clear
  end

  it("starts empty") do
    expect(Recipe.all).to eql([])
  end

  it("should create a new recipe") do
    title = "Avocado smoothie"
    recipe = Recipe.create(title)
    expect(Recipe.all).to eql([recipe])
  end

  it("should read a recipe") do
    title = "Avocado smoothie"
    recipe = Recipe.create(title)
    expect(Recipe.find_by(title)).to eql(recipe)
  end

  it("should return nil with incorrect recipe title") do
    title = "Avocado smoothie"
    title2 = "Gaucamole"
    recipe = Recipe.create(title)
    expect(Recipe.find_by(title2)).to eql(nil)
  end

  it("should read recipe when there are more recipes") do
    title = "Avocado smoothie"
    title2 = "Gaucamole"
    title3 = "Avacodo Salad"
    recipe1 = Recipe.create(title)
    recipe2 = Recipe.create(title2)
    recipe3 = Recipe.create(title3)
    expect(Recipe.find_by(title2)).to eql(recipe2)
  end

  it("should update a recipe") do
    title = "Avocado smoothie"
    titleUpdated = "Gaucamole"
    Recipe.create(title)
    recipe = Recipe.find_by(title)
    Recipe.update(recipe, titleUpdated)
    recipeUpdated = Recipe.find_by(titleUpdated)
    expect(recipeUpdated.title).to eql(titleUpdated)
  end

  it("should delete a recipe") do
    title = "Avocado smoothie"
    recipe = Recipe.create(title)
    Recipe.delete(recipe)
    expect(Recipe.all).to eql([])
  end

  it("should delete a recipe when there are more recipes") do
    title = "Avocado smoothie"
    title2 = "Gaucamole"
    title3 = "Avacodo Salad"
    recipe1 = Recipe.create(title)
    recipe2 = Recipe.create(title2)
    recipe3 = Recipe.create(title3)
    Recipe.delete(recipe2)
    expect(Recipe.all).to eql([recipe1, recipe3])
  end
end
