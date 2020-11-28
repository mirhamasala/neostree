class DashboardsController < ApplicationController
  def show
    # Don't have a dashboard class
    authorize :dashboard

    @recipes = policy_scope(Recipe.author(current_user)).alphabetize
  end
end
