class AddStudentToUser < ActiveRecord::Migration
  def change
    add_reference :users, :student, index: true
  end
end
