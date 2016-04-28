class Result < ActiveRecord::Base
  PASSED = 'passed'
  FAILED = 'failed'
  NOSHOW = 'noshow'
  
  validates :name, presence: true, uniqueness: true
end
