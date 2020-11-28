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

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.alphabetize
    end
  end
end
