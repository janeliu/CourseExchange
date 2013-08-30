class CreateWanteds < ActiveRecord::Migration
  def change
    create_table :wanteds do |t|

      t.timestamps
    end
  end
end
