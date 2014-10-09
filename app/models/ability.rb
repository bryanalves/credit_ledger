class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    #Authenticate everything for now
    can :manage, :all
    cannot :manage, User unless user.admin?
  end
end
