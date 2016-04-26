class Core < Exam
  belongs_to :clazz

  validates :clazz, presence: true
end
