class EnrollmentsController < SecuredController
  before_action :set_enrollment, only: [:destroy]

  respond_to :html

  def create
    exam = Exam.find(enrollment_params[:exam_id])
    if exam.is_open_for_registration?
      Enrollment.create!(exam: exam, student: current_user.student)
    end
    redirect_to root_url
  end

  def destroy
    if @enrollment.exam.is_open_for_registration?
      @enrollment.destroy
    end

    redirect_to root_url
  end

  private
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    def enrollment_params
      params.require(:enrollment).permit(:exam_id)
    end
end
