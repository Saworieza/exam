class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :type
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :semester
      t.string :location
      t.date :registration_deadline
      t.references :clazz, index: true, foreign_key: true

      t.timestamps
    end
  end
end
