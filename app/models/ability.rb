# frozen_string_literal: true

# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     # Define abilities for the user here. For example:
#     #
#     #   return unless user.present?
#     #   can :read, :all
#     #   return unless user.admin?
#     #   can :manage, :all
#     #
#     # The first argument to `can` is the action you are giving the user
#     # permission to do.
#     # If you pass :manage it will apply to every action. Other common actions
#     # here are :read, :create, :update and :destroy.
#     #
#     # The second argument is the resource the user can perform the action on.
#     # If you pass :all it will apply to every resource. Otherwise pass a Ruby
#     # class of the resource.
#     #
#     # The third argument is an optional hash of conditions to further filter the
#     # objects.
#     # For example, here the user can only update published articles.
#     #
#     #   can :update, Article, published: true
#     #
#     # See the wiki for details:
#     # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
#   end
# end


# app/models/ability.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    # Users can destroy their own posts and comments
    can :destroy, Post, author_id: user.id
    can :destroy, Comment, author_id: user.id

    # Logged-in users can read (access index and show) posts
    can :read, Post if user.persisted?

    # Admins can manage all resources
    can :manage, :all if user.role == "admin"
  end
end


