class RecipePolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  def show?
    true
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
