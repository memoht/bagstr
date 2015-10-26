class CreateLockers < ActiveRecord::Migration
  def change
    create_table :lockers do |t|
      t.string :locker_no
      t.integer :size_code
      t.boolean :reserved, default: false, null: false

      t.timestamps null: false
    end
  end
end
