class Student < ActiveRecord::Base
  after_create :create_user

  has_many :enrollments
  has_many :exams, :through => :enrollments

  validates :username, :txstateid, :last_name, :first_name, :major, :email,
    :address, :city, :state, :zip, :phone, presence: true

  validates :username, :txstateid, :email, uniqueness: true

  attr_accessor :initial_password

  private

  def create_user
    User.create!(username: self.username, password: self.initial_password, password_confirmation: self.initial_password, role: Role.student_role, student: self)
  end
end
