class Employee < ActiveRecord::Base
  attr_accessible :employee_card_id, :first_name, :last_name, :is_admin
  validates_presence_of :employee_card_id, :first_name, :last_name
  has_many :clock_records

  # Remeber:
  # When you write using ActiveRecord it gets localtime, converts and saves it in UTC time
  # When you search it gets localtime, converts and uses it in UTC
  # When you read it retuns UTC time
  # Time.now returns localtime
  # 1.days.ago and similar return UTC time
  # All calculations here should be made in localtime

  def seven_days_records
    clock_records.where("created_at >= ?", 7.days.ago.localtime.beginning_of_day).order('created_at')
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

  def last_work_hours
    last_out = clock_records.where(clocked_in: false).last.created_at
    last_work_seconds = last_out.to_i - clock_records.where('created_at <= ?', last_out).where(clocked_in: true).last.created_at.to_i rescue 0

    mm, ss = last_work_seconds.divmod(60)
    hh, mm = mm.divmod(60)

    "%02d:%02d:%02d" % [hh, mm, ss]
  rescue => e
    Rails.logger.error "Error happened in last_work_hours:\n\t#{e.inspect}"
    "N/A"
  end

  private

  def work_hours(start)
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
  rescue => e
    Rails.logger.error "Error happened in work_hours:\n\t#{e.inspect}"
    "N/A"
  end
end
