class DashboardsController < ApplicationController
  def show
    authorize :dashboard
    @units = Unit.all.alphabetize
    @ingredients = Ingredient.all.alphabetize
  end
end
