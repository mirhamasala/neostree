class DashboardPolicy < ApplicationPolicy
  def show?
    user.admin?
  end
end