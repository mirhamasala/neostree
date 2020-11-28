class RecipePolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    record.status_published? || (user&.admin? || record.user == user)
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
