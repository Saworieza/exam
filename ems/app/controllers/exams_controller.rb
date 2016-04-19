class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @exams = Exam.all
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
    @exam.save
    respond_with(@exam)
  end

  def update
    @exam.update(exam_params)
    respond_with(@exam)
  end

  def destroy
    @exam.destroy
    respond_with(@exam)
  end

  private
    def set_exam
      @exam = Exam.find(params[:id])
    end

    def exam_params
      params.require(:exam).permit(:exam_type, :date, :start_time, :end_time, :semester, :location, :registration_deadline)
    end
end
