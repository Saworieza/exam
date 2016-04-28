class Role < ActiveRecord::Base
  has_many :users

  validates :name, :description, presence: true
  validates :name, :description, uniqueness: true

  def self.student_role
    Role.find_by_name('Student')
  end
end
