class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy, :publish, :enter_results, :save_results]

  respond_to :html

  def index
    @exams = Exam.order(:date, :start_time)
    respond_with(@exams)
  end

  def show
    respond_with(@exam)
  end

  def new
    @exam = Exam.new
    respond_with(@exam)
  end

  def edit
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      redirect_to exams_path
    else
      respond_with(@exam)
    end
  end

  def update
    if @exam.update(exam_params)
      redirect_to exams_path
    else
      respond_with(@exam)
    end
  end

  def destroy
    if @exam.destroy
      redirect_to exams_path
    else
      respond_with(@exam)
    end
  end

  def publish
    @exam.published = true
    @exam.save
    redirect_to exams_path
  end

  def enter_results
  end

  def save_results
    Enrollment.transaction do
      result_params.each_pair do |key,value|
        enrollment = @exam.enrollments.find_by_id(key)
        if enrollment
          enrollment.result = Result.find_by_name(value)
        end
        enrollment.save!
      end
    end
  end

  private
    def set_exam
      @exam = Exam.find(params[:id])
    end

    def exam_params
      parameters = params.require(:exam).permit(:exam_type, :clazz_id, :date, :start_time, :end_time, :semester, :location, :registration_deadline)
      if parameters[:exam_type] != 'Core'
        parameters[:clazz_id] = nil
      end

      parameters
    end

    def result_params
      params.require(:result)
    end
end
