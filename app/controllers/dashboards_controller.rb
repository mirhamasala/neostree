class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @recipes = Recipe.all.alphabetize
    @units = Unit.all.sort
  end
end
