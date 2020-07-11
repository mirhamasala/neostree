class DashboardsController < ApplicationController
  def show
    @units = Unit.all.alphabetize
    @ingredients = Ingredient.all.alphabetize
  end
end
