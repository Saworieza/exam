class Student < ActiveRecord::Base
  has_many :enrollments
  has_many :exams, :through => :enrollments
  has_one :address, dependent: :destroy

  validates :username, :txstateid, :last_name, :first_name, :major, :email, :phone, presence: true

  validates :username, :txstateid, :email, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

end
