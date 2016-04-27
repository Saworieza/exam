class HomeController < SecuredController
  def index
    if current_user.is_student?
      # load registered
      @registered = Enrollment.where(student: current_user.student).joins(:exam).merge(Exam.order(:date))
      registered_ids = @registered.collect {|e| e.exam_id }

      #open for registration and not registered
      @not_registered_and_open = Exam.where('registration_deadline >= current_date and id NOT IN (?)', registered_ids).order(:date)
      render 'student_home'
    end
  end
end
