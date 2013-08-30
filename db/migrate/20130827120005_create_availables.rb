class CreateAvailables < ActiveRecord::Migration
  def change
    create_table :availables do |t|

      t.timestamps
    end
  end
end
