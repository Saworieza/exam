class Exam < ActiveRecord::Base
  EXAM_TYPE_LIST = %w(Core Communication Programming)
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

  def is_open_for_registration?
    registration_deadline >= Date.today
  end

  def is_done?
     Date.today >= self.date
  end

end
