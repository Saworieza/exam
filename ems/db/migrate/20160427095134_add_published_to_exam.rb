class AddPublishedToExam < ActiveRecord::Migration
  def change
    add_column :exams, :published, :boolean
  end
end
