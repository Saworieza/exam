class Address < ActiveRecord::Base
  belongs_to :student

  validates :student, :street, :city, :state, :zip, presence: true
end
