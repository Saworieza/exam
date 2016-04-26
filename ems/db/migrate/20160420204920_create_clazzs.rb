class CreateClazzs < ActiveRecord::Migration
  def change
    create_table :clazzs do |t|
      t.string :name
      t.references :group, index: true, foreign_key: true

      t.timestamps
    end
  end
end
