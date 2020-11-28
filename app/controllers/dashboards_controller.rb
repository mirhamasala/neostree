class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @recipes = policy_scope(Recipe.author(current_user)).alphabetize
  end
end
