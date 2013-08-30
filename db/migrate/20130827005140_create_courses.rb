class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :SLN
      t.references :college

      t.timestamps
    end
    add_index :courses, :college_id
  end
end
