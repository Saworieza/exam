class Student < ActiveRecord::Base
  after_create :create_user

  has_many :enrollments
  has_many :exams, :through => :enrollments

  validates :username, :txstateid, :last_name, :first_name, :major, :email,
    :address, :city, :state, :zip, :phone, presence: true

  validates :username, :txstateid, :email, uniqueness: true

  private

  def create_user
    User.create!(username: self.username, password: self.txstateid, password_confirmation: self.txstateid, role: Role.student_role, student: self)
  end
end
