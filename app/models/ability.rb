class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)
    
    # Define abilities for regular users
    if user.role.blank? || user.role == ""
      can :read, Post
      can :read, Comment
      can :create, Post, author_id: user.id
      can :create, Comment, author_id: user.id
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, author_id: user.id
    end

    # Define abilities for admin users
    if user.role == 'admin'
      can :destroy, Post
      can :destroy, Comment
    end
  end
end