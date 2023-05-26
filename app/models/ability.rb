class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    return unless user.present?

    can :read, :all
    can :create, [Comment, Post]
    can :new, Post

    user_role = user.role || 'default'

    case user_role
    when 'admin'
      can :manage, :all
    else
      can :destroy, Comment, author: user
      can :destroy, Post, author: user
    end

    # Rest of your code...
  end
end
