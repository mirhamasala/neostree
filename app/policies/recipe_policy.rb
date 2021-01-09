class RecipePolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    record.status_published? || (user&.admin? || user&.author_of?(record))
  end

  def update?
    user && (user.admin? || user.author_of?(record))
  end

  def destroy?
    update?
  end

  def update_status?
    update?
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
