class CreateEmployeesTable < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_card_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :is_admin

      t.timestamps
    end
  end
end
