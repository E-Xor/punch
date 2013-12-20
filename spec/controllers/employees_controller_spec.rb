require 'spec_helper'

describe EmployeesController do
  describe "GET #index" do
    it "should respond successfully" do
      employee = create(:employee)
      get :index
      response.should be_success
      response.status.should == 200
      response.should render_template("index")
      assigns(:all_employees).should == [employee]
    end
  end

  describe "POST #create" do
    it 'should successfully create an employee' do
      employee = build(:employee)
      post :create,
        employeeCardId: employee.employee_card_id,
        firstName: employee.first_name,
        lastName: employee.last_name,
        isAdmin: employee.is_admin

      response.should redirect_to(employees_path)
      Employee.all.length.should == 1
      Employee.first.employee_card_id.should == employee.employee_card_id
    end

    it 'should fail creating an employee' do
      employee = build(:employee)
      post :create,
        firstName: employee.first_name,
        lastName: employee.last_name,
        isAdmin: employee.is_admin

      response.should redirect_to(employees_path)
      Employee.all.length.should == 0
    end
  end

  describe "DELETE #destroy" do
  end
end
