class DashboardsController < ApplicationController
  def show
    @units = Unit.all
  end
end
