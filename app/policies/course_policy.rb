class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    user.admin
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    user.admin
  end

  def destroy?
    user.admin
  end
end
