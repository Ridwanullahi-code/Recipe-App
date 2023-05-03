class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true

    return unless user.present?

    can :read, :all
    can :manage, Recipe, user: user
    can :manage, Inventory, user: user
  end
end
