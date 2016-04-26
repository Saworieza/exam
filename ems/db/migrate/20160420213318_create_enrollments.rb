class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :exam, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.references :result, index: true, foreign_key: true
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
