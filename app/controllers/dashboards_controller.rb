class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @ingredients = Ingredient.all.alphabetize
    @recipes = Recipe.all.alphabetize
    @units = Unit.all.alphabetize
  end
end
