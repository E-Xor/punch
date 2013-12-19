class Employee < ActiveRecord::Base
  attr_accessible :employee_card_id, :first_name, :last_name, :is_admin
  validates_presence_of :employee_card_id, :first_name, :last_name
  has_many :clock_records

  def today_hours
    work_hours(Time.zone.now.beginning_of_day)
  end

  def seven_days_hours
    work_hours(7.days.ago.beginning_of_day, true)
  end

  def is_admin?
    is_admin
  end

  private

  def work_hours(start, include_days=false)
    total = 0
    last_clock_records = clock_records.where("created_at >= ?", start)
    last_clock_records.each_with_index do |cr, i|
      next unless cr.clocked_in

      diff = last_clock_records[i+1].created_at - cr.created_at rescue 0
      total += diff
    end

    mm, ss = total.divmod(60)
    hh, mm = mm.divmod(60)

    r =  "%02d:%02d:%02d" % [hh, mm, ss]
    if include_days
      dd, hh = hh.divmod(24)
      r = "%d day(s), %02d:%02d:%02d" % [dd, hh, mm, ss] # Probably move to the view
    end

    r
  end
end
