class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @recipes = policy_scope(current_user.recipes)
  end
end
