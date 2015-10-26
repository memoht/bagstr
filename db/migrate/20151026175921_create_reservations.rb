class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :confirmation_no
      t.string :guest_name
      t.integer :size_code
      t.string :status
      t.references :locker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
