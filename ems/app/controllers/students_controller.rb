class StudentsController < SecuredController
  load_and_authorize_resource

  before_action :set_student, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @query = search_params[:query]
    if @query.present?
      @students = Student.where('username LIKE :q or'\
        ' txstateid LIKE :q or last_name LIKE :q or first_name LIKE :q or'\
        ' major LIKE :q or email LIKE :q', {q: "%#{@query}%"})
    else
      @students = Student.all
    end
    respond_with(@students)
  end

  def show
    respond_with(@student)
  end

  def new
    @student = Student.new
    respond_with(@student)
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.save
    respond_with(@student)
  end

  def update
    @student.update(student_params)
    respond_with(@student)
  end

  def destroy
    @student.destroy
    respond_with(@student)
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:username, :txstateid, :last_name, :first_name, :major, :email, :phone, :address, :city, :state, :zip, :query)
    end

    def search_params
      params.permit(:query)
    end
end
