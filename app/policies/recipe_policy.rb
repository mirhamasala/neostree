class RecipePolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    true
  end

  def update?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end

  def update_status?
    user.admin? || record.user == user
  end
end
