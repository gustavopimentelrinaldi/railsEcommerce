class AdminPolicy < ApplicationPolicy

  def new?
    user.full_access?
  end

  def edit?
    user.full_access?
  end

  def destroy?
    user.full_access?
  end

  def permitted_attributes
    if user.full_access?
      [:name, :email, :role, :password, :password_confirmation]
    else
      [:name, :email, :password, :password_confirmation]
    end
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
