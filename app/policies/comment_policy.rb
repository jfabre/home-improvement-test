class CommentPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @comment = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? || @comment.user == @current_user 
  end

  def create?
    true
  end  

  def update?
    @current_user.admin?
  end  

  def destroy?
    @current_user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end