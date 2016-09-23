class UserPolicy < ApplicationPolicy
  def manage?
    user.admin?
  end

  def destroy?
    manage? && user.id != record.id
  end
end
