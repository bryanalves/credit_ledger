class CategoryPolicy < ApplicationPolicy
  def manage?
    user.admin?
  end
end
