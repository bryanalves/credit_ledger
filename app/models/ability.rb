class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, :all if user.user? || user.admin?
    cannot :manage, User unless user.admin?
    cannot :manage, Category unless user.admin?
  end
end
