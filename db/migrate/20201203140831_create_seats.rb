class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.integer :row_number
      t.integer :col_number
      t.references :seat_group
      t.integer :status
      t.integer :cat

      t.timestamps
    end
  end
end
