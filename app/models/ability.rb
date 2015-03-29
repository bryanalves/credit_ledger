class Ability
  include CanCan::Ability

  def initialize(user, params)
    user ||= User.new # guest user (not logged in)
    can :manage, :all if user.persisted? || user.admin?
    cannot :manage, User unless user.admin?
    cannot :manage, Category unless user.admin?
    cannot :manage, Customer unless user.admin?
    can :read, Customer, view_token: params[:view_token]
  end
end
