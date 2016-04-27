class Enrollment < ActiveRecord::Base
  belongs_to :exam
  belongs_to :student
  belongs_to :result

  validates :exam, :student, presence: true
  validates :student, uniqueness: { scope: :exam, message: "each student should have only one result per exam" }
end
