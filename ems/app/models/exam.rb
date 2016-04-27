class Exam < ActiveRecord::Base
  EXAM_TYPE_LIST = %w(Communication Programming Core)
  SEMESTER_LIST = %w(Spring Fall)
  belongs_to :clazz

  has_many :enrollments
  has_many :students, :through => :enrollments

  validates :exam_type, :date, :start_time, :end_time, :semester, :location, :registration_deadline, presence: true
  validates :semester, inclusion: { in: SEMESTER_LIST }
  validates :exam_type, inclusion: { in: EXAM_TYPE_LIST }

  validates :clazz, presence: true, if: :is_core?

  def is_core?
    exam_type == 'Core'
  end

end
