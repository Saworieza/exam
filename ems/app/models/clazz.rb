class Clazz < ActiveRecord::Base
  belongs_to :group

  has_many :cores, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :group, presence: true

  def to_s
    "#{name}"
  end
end
