class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :exam_type
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :semester
      t.string :location
      t.date :deadline

      t.timestamps
    end
  end
end
