class CustomerPolicy < ApplicationPolicy
  def manage?
    user.admin?
  end
end
