class CollectionPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def show?
    record.status_public? || (user&.admin? || record.user == user)
  end

  def destroy?
    user.admin? || record.user == user
  end

  def update_status?
    user.admin? || record.user == user
  end
end
