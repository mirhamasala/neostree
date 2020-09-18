class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @recipes = Recipe.all.author?(current_user).alphabetize
  end
end
