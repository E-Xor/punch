require 'spec_helper'

# ActiveRecord and FactoryGirl get localtime, convert and save it as UTC
# So all created_at values should be in localtime

describe Employee do
  before do
    @employee = create(:employee)
    @admin = create(:admin)
  end
  
  it 'should answer properly for is_admin?' do
    @employee.is_admin?.should == false
    @admin.is_admin?.should == true
  end

  it 'should not include particular record in seven_days_records' do
    create(:clock_record_in, employee_id: @employee.id, created_at: 7.days.ago.localtime.beginning_of_day-1.minute)
    create(:clock_record_out, employee_id: @employee.id, created_at: 7.days.ago.localtime.beginning_of_day+1.minute)
    sdr = @employee.seven_days_records
    sdr.length.should == 1
    sdr[0].clocked_in.should == false

    @employee.seven_days_hours.should == "00:01:00" # should return this 1 munute between beginning of 7th day ago and 1 minute after
  end

  it 'should return hours worked today' do
    create(:clock_record_in, employee_id: @employee.id, created_at: Time.now.beginning_of_day-1.second)
    create(:clock_record_out, employee_id: @employee.id, created_at: Time.now.beginning_of_day)
    create(:clock_record_in, employee_id: @employee.id, created_at: Time.now.beginning_of_day)
    create(:clock_record_out, employee_id: @employee.id, created_at: Time.now.beginning_of_day+1.second)
    create(:clock_record_in, employee_id: @employee.id)
    create(:clock_record_out, employee_id: @employee.id)

    @employee.today_hours.should == "00:59:01" # 1 second(not 2!) + 59 minutes
  end

  it 'should properly detect edge when returns hours worked today' do
    create(:clock_record_in, employee_id: @employee.id, created_at: Time.now.beginning_of_day-1.second)
    create(:clock_record_out, employee_id: @employee.id, created_at: Time.now.beginning_of_day+1.second)

    @employee.today_hours.should == "00:00:01" # 1 second between midnight and clock out
  end

  it 'should return hours worker for the last 7 days' do
    create(:clock_record_in, employee_id: @employee.id, created_at: 7.days.ago.localtime.beginning_of_day-1.minute)
    create(:clock_record_out, employee_id: @employee.id, created_at: 7.days.ago.localtime.beginning_of_day)
    create(:clock_record_in, employee_id: @employee.id, created_at: 7.days.ago.localtime.beginning_of_day)
    create(:clock_record_out, employee_id: @employee.id, created_at: 7.days.ago.localtime.beginning_of_day+1.minutes)
    create(:clock_record_in, employee_id: @employee.id, created_at: Time.now.beginning_of_day-1.second)
    create(:clock_record_out, employee_id: @employee.id, created_at: Time.now.beginning_of_day)
    create(:clock_record_in, employee_id: @employee.id, created_at: Time.now.beginning_of_day)
    create(:clock_record_out, employee_id: @employee.id, created_at: Time.now.beginning_of_day+1.second)
    create(:clock_record_in, employee_id: @employee.id)
    create(:clock_record_out, employee_id: @employee.id)

    @employee.seven_days_hours.should == "01:00:02" # 1 minute(not 2!) + 2 seconds + 59 minutes
  end

  it 'should return amount of hours worked last time' do
    create(:clock_record_in, employee_id: @employee.id)
    create(:clock_record_out, employee_id: @employee.id)
    create(:clock_record_in, employee_id: @employee.id, created_at: Time.now)

    @employee.last_work_hours.should == "00:59:00"
  end

end
