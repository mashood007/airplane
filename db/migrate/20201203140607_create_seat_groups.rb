class CreateSeatGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :seat_groups do |t|
      t.integer :total_columns
      t.integer :total_rows
      t.references :plane
      t.integer :chain_number

      t.timestamps
    end
  end
end
