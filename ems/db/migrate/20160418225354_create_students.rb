class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.string :txstateid
      t.string :last_name
      t.string :first_name
      t.string :major
      t.string :email

      t.timestamps
    end
  end
end
