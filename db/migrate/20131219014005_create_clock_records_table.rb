class CreateClockRecordsTable < ActiveRecord::Migration
  def change
    create_table :clock_records do |t|
      t.integer :employee_id, null: false
      t.boolean :clocked_in

      t.timestamps
    end
  end
end
