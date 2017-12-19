class ProjectPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @project = model
  end

  def index?
    true
  end

  def show?
    @project.public_project? || @current_user.admin? || @current_user == @project.owner
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @current_user.admin? || @current_user == @project.owner
  end

  def edit?
    update?
  end

  def destroy?
    @current_user.admin? || @current_user == @project.owner
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(type: 'public')
      end
    end
  end
end