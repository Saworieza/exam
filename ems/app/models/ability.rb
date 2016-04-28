class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :default_crud
    alias_action :publish, :enter_results, :save_results, :to => :results_crud

    if user.faculty?
      can :default_crud, Exam
      can :results_crud, Exam
      can :default_crud, Student
      can :view_completed, :home
    elsif user.student?
      can :default_crud, Enrollment
    end
    can :index, :home
  end
end
