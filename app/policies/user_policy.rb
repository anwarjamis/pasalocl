class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin
  end

  def show?
    record.id == user.id || user.admin
  end

  def edit?
    update?
  end

  def update?
    record.id == user.id || user.admin
  end
end
