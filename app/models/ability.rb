# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :delete, Comment, author: user
    can :delete, Post, author: user
    return unless user.admin?
    can :delete, Post
    can :delete, Comment
  end
end
