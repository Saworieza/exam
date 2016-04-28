class HomeController < SecuredController
  def index
    authorize! :index, :home

    if current_user.student?
      # load registered
      @registered = Enrollment.where(student: current_user.student).joins(:exam).merge(Exam.order(:date))
      registered_ids = @registered.collect {|e| e.exam_id }

      #open for registration and not registered
      if registered_ids.empty?
        @not_registered_and_open = Exam.where('registration_deadline >= ?', Date.today).order(:date)
      else
        @not_registered_and_open = Exam.where('registration_deadline >= ? and id NOT IN (?)', Date.today, registered_ids).order(:date)
      end
      render 'student_home'
    else
      redirect_to exams_path
    end
  end

  def view_completed
    authorize! :view_completed, :home

    students = Student.all
    @completed = students.collect do |student|
      (has_completed(student.enrollments, 'Programming') and
        has_completed(student.enrollments, 'Communication') and
        has_completed(student.enrollments, 'Core') ) ? student : nil
    end.compact
  end

  private
    def has_completed(enrollments, exam_type)
      if exam_type == 'Programming' or exam_type == 'Communication'
        return has_completed_basic(enrollments, exam_type)
      else
        return (has_completed_group(enrollments, Group.find_by_name('Group 1')) and
          has_completed_group(enrollments, Group.find_by_name('Group 2')) and
          has_completed_group(enrollments, Group.find_by_name('Group 3')) and
          has_completed_group(enrollments, Group.find_by_name('Group 4')))
      end
    end

    def has_completed_basic(enrollments, exam_type)
      enrollments.each do |e|
        if e.exam.exam_type == exam_type and e.exam.published? and e.result.present? and e.result.name == Result::PASSED
          return true
        end
      end
      return false
    end

    def has_completed_group(enrollments, group)
      enrollments.each do |e|
        if e.exam.exam_type == 'Core' and e.exam.clazz.group == group and e.exam.published? and e.result.present? and e.result.name == Result::PASSED
          return true
        end
      end
      return false
    end
end
