class Enrollment < ActiveRecord::Base
  belongs_to :exam, dependent: :restrict_with_error
  belongs_to :student, dependent: :restrict_with_error
  belongs_to :result, dependent: :restrict_with_error

  validates :exam, :student, presence: true
  validates :student, uniqueness: { scope: :exam, message: "each student should have only one result per exam" }
end
