class Exam < ActiveRecord::Base
  EXAM_TYPE_LIST = %w(Communication Programming Core)

  has_many :enrollments
  has_many :students, :through => :enrollments

  validates :type, :date, :start_time, :end_time, :semester, :location, :registration_deadline, presence: true
  validates :semester, inclusion: { in: %w(Fall Spring) }
end
