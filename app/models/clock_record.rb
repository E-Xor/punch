class ClockRecord < ActiveRecord::Base
  attr_accessible :employee_id, :clocked_in
  validates_presence_of :employee_id
  belongs_to :employee

end