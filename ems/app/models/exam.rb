class Exam < ActiveRecord::Base
  EXAM_TYPE_LIST = %w(Core Communication Programming)
  SEMESTER_LIST = %w(Spring Fall)
  belongs_to :clazz

  has_many :enrollments
  has_many :students, :through => :enrollments

  validates :exam_type, :semester, :location, presence: true
  validates :semester, inclusion: { in: SEMESTER_LIST }
  validates :exam_type, inclusion: { in: EXAM_TYPE_LIST }

  validates :clazz, presence: true, if: :is_core?

  validate do
    self.errors[:date] << "must be a valid date yyyy-mm-dd" unless date.present?
    self.errors[:registration_deadline] << "must be a valid date yyyy-mm-dd" unless registration_deadline.present?
    self.errors[:start_time] << "must be a valid time HH:MM:SS" unless start_time.present?
    self.errors[:end_time] << "must be a valid time HH:MM:SS" unless end_time.present?
  end


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
