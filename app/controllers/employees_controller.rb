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
    Rails.logger.debug "Destroyed!"
    @employee = Employee.find(params[:id])
    @employee.destroy
    render json: {message: "#{@employee.first_name} #{@employee.last_name} was successfully removed"}
  end

end
