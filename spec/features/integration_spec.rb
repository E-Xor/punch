# new admin -> clock in (with other users info)
require 'spec_helper'

describe "Create admin, clock in" do
  it 'should successfully create admin, clock in, show others info, clock out' do
    employee = create(:employee)
    admin = build(:admin)

    # create admin
    visit '/employees'
    assert page.has_content?(employee.employee_card_id)
    assert page.has_no_content?('yes')
    fill_in "employeeCardId", with: admin.employee_card_id
    fill_in "firstName", with: admin.first_name
    fill_in "lastName", with: admin.last_name
    check "isAdmin"
    click_button "createEmployeeCard"
    assert page.has_content?('yes') # Admin is created

    # clock in
    visit '/'
    fill_in "employeeId", with: admin.employee_card_id
    click_button "submitInOut"
    assert page.has_content?("Hi, #{admin.first_name}")

    # show others info
    assert page.has_content?(employee.last_name)

    # clock out
    create(:clock_record_in, employee_id: employee.id)
    create(:clock_record_out, employee_id: employee.id)
    visit '/'
    fill_in "employeeId", with: admin.employee_card_id
    click_button "submitInOut"
    assert page.has_content?("Bye, #{admin.first_name}")

    # show others info
    assert page.has_content?("00:59:00")
  end

  it 'should successfully create employee, clock in, clock out, report' do
    employee = create(:employee)
    admin = build(:admin)

    # create admin
    visit '/employees'
    assert page.has_content?(employee.employee_card_id)
    assert page.has_no_content?('yes')
    fill_in "employeeCardId", with: employee.employee_card_id
    fill_in "firstName", with: employee.first_name
    fill_in "lastName", with: employee.last_name

    click_button "createEmployeeCard"
    assert page.has_no_content?('yes') # Admin is created

    # clock in
    visit '/'
    fill_in "employeeId", with: employee.employee_card_id
    click_button "submitInOut"
    assert page.has_content?("Hi, #{employee.first_name}")

    # don't show others info
    assert page.has_no_content?(admin.last_name)

    # Detectable time between clicking in and out
    sleep 2

    # clock out
    visit '/'
    fill_in "employeeId", with: employee.employee_card_id
    click_button "submitInOut"
    assert page.has_content?("Bye, #{employee.first_name}")

    # report
    visit '/'
    fill_in "employeeId", with: employee.employee_card_id
    click_button "report"
    assert page.has_content?("Hi, #{employee.first_name}")
    assert page.has_content?("In")
    assert page.has_content?("Out")
    # I assume
    time_diff = employee.clock_records.last.created_at.to_i - employee.clock_records.where(clocked_in: true).last.created_at.to_i
    assert page.has_content?("00:00:0#{time_diff}")
  end
end