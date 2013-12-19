class EmployeesController < ApplicationController

  def index
    @all_employees = Employee.all
    @employee = Employee.new
  end

  def create
    Employee.create!(
      employee_card_id: params[:employeeCardId],
      first_name: params[:firstName],
      last_name: params[:lastName],
      is_admin: params[:isAdmin]
    )
  rescue => e
    Rails.logger.error "Error happened during employee creation:\n\t#{e.inspect}"
    flash[:alert] = "Error happened during employee creation"
  ensure
    redirect_to action: "index"
  end

  def destroy
  end

end