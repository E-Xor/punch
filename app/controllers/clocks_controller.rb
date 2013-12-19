class ClocksController < ApplicationController

  def new
    @clock_record = ClockRecord.new
  end

  def create
    if params[:report]
      redirect_to action: "report"
      return
    end

    @employee = Employee.find_by_employee_card_id(params[:employeeId])
    clocked_in = @employee.clock_records.last.clocked_in rescue false
    @clock_record = ClockRecord.create!(
      employee_id: @employee.id,
      clocked_in: !clocked_in
    )

    @all_employees = Employee.where("id != ?", @employee.id) if @employee.is_admin?

    render "today_hours"
  rescue => e
    Rails.logger.error "Error happened during Clocking In/Out:\n\t#{e.inspect}"
    flash[:alert] = e.inspect
    redirect_to action: "new"
  end

  def report
    Rails.logger.debug "report"
  end

end
