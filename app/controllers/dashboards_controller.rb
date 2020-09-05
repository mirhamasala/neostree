class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @recipes = Recipe.all.alphabetize
    @units = Unit.all.alphabetize
  end
end
