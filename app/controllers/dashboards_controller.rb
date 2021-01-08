class DashboardsController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :show

  def show
    authorize :dashboard
  end
end
