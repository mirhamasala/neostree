class RecipePolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def update_status?
    record.user == user
  end
end
