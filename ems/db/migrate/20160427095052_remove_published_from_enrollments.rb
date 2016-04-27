class RemovePublishedFromEnrollments < ActiveRecord::Migration
  def change
    remove_column :enrollments, :published, :boolean
  end
end
