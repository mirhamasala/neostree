class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @recipes = Recipe.all.alphabetize
  end
end
