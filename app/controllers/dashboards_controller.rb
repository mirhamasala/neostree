class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @recipes = Recipe.author(current_user).alphabetize
  end
end
