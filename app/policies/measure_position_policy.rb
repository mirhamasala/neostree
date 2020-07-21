class MeasurePositionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def update?
      user.admin?
    end
  end
end
