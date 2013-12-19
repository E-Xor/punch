class Employee < ActiveRecord::Base
  attr_accessible :employee_card_id, :first_name, :last_name, :is_admin
  validates_presence_of :employee_card_id, :first_name, :last_name
  has_many :clock_records

  def today_hours
    total_today = 0
    today_clock_records = clock_records.where("created_at >= ?", Time.zone.now.beginning_of_day)
    today_clock_records.each_with_index do |cr, i|
      next unless cr.clocked_in

      diff = today_clock_records[i+1].created_at - cr.created_at rescue 0
      total_today += diff
      Rails.logger.debug "diff: #{diff}"
    end
    Time.at(total_today).gmtime.strftime('%T')
  end
end
