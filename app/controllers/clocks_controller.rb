class ClocksController < ApplicationController

  def new
    @clock_record = ClockRecord.new
  end

  def create
    if params[:report]
      redirect_to action: "report", employeeId: params[:employeeId]
      return
    end

    @employee = Employee.find_by_employee_card_id(params[:employeeId])
    clocked_in = @employee.clock_records.last.clocked_in rescue false
    @clock_record = ClockRecord.create!(
      employee_id: @employee.id,
      clocked_in: !clocked_in
    )

    @all_other_employees = Employee.where("id != ?", @employee.id) if @employee.is_admin?

    render "today_hours"
  rescue => e
    Rails.logger.error "Error happened during Clocking In/Out:\n\t#{e.inspect}"
    flash[:alert] = "Error happend trying to clock you in/out. Please check your Employee Card ID or talk to support."
    redirect_to action: "new"
  end

  def report
    Rails.logger.debug "report params: #{params.inspect}"
    @employee = Employee.find_by_employee_card_id(params[:employeeId])
    fail "Employee not found" unless @employee
  rescue => e
    Rails.logger.error "Error happened during creating report:\n\t#{e.inspect}"
    flash[:alert] = "Employee not found. Please check your Employee Card ID or talk to support."
    redirect_to action: "new"
  end

end
