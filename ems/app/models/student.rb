class Student < ActiveRecord::Base
  has_many :enrollments
  has_many :exams, :through => :enrollments

  validates :username, :txstateid, :last_name, :first_name, :major, :email,
    :address, :city, :state, :zip, :phone, presence: true

  validates :username, :txstateid, :email, uniqueness: true

end
