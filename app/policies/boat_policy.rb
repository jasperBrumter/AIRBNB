class BoatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(latitude: nil, longitude: nil)
    end
  end

  def show?
    true
  end

  def edit?
    record.user == user #|| user.admin
  end

  def update?
    record.user == user #|| user.admin
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user #|| user.admin
  end
end
