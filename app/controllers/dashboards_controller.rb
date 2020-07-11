class DashboardsController < ApplicationController
  def show
    @units = Unit.all
    @ingredients = Ingredient.all.alphabetize
  end
end
