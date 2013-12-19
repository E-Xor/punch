class Employee < ActiveRecord::Base
  attr_accessible :employee_card_id, :first_name, :last_name, :is_admin
  validates_presence_of :employee_card_id, :first_name, :last_name
  has_many :clock_records

end