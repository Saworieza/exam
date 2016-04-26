class Group < ActiveRecord::Base
  has_many :clazzs, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
