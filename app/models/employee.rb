class Employee < ActiveRecord::Base
  attr_accessible :employee_card_id, :first_name, :last_name, :is_admin
  validates_presence_of :employee_card_id, :first_name, :last_name
  has_many :clock_records

  def seven_days_records
    clock_records.where("created_at >= ?", 7.days.ago.beginning_of_day).order('created_at')
  end

  def today_hours
    work_hours(Time.now.beginning_of_day)
  end

  def seven_days_hours
    work_hours(7.days.ago.localtime.beginning_of_day)
  end

  def is_admin?
    is_admin
  end

  private

  def work_hours(start, include_days=false)
    total = 0
    last_clock_records = clock_records.where("created_at >= ?", start).order('created_at')
    last_clock_records.each_with_index do |cr, i|
      next unless cr.clocked_in

      next_clock_out = last_clock_records[i+1].created_at.localtime rescue Time.now
      diff = next_clock_out - cr.created_at.localtime
      total += diff
    end

    mm, ss = total.divmod(60)
    hh, mm = mm.divmod(60)

    "%02d:%02d:%02d" % [hh, mm, ss]
  end
end
