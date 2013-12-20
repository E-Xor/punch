require 'spec_helper'

describe ClocksController do
  before do
    @employee = create(:employee)
    @admin = create(:admin)
  end

  describe "GET #new" do
    it "should respond successfully" do
      get :new
      response.should be_success
      response.status.should == 200
      response.should render_template("new")
    end
  end

  describe "POST #create" do
    it 'should redirect to report' do
      post :create, report: 'report'
      response.should redirect_to(report_path)
    end

    it 'should create a clock record and show success page but not other employees data' do
      post :create, employeeId: @employee.employee_card_id
      response.should be_success
      response.status.should == 200
      response.should render_template("today_hours")
      assigns(:employee).should == @employee
      assigns(:clock_record).employee_id.should == @employee.id
      assigns(:all_other_employees).should == nil
    end

    it 'should create a clock record, show success page and all other employees data' do
      post :create, employeeId: @admin.employee_card_id
      response.should be_success
      response.status.should == 200
      response.should render_template("today_hours")
      assigns(:employee).should == @admin
      assigns(:clock_record).employee_id.should == @admin.id
      assigns(:all_other_employees).length.should == 1
    end

    it 'should redirect to new on wrong employee id' do
      post :create, employeeId: 'wrong id'
      response.should_not be_success
      response.status.should == 302
      response.should redirect_to(new_clock_path)
    end
  end

  describe "GET #report" do
    it "should respond successfully" do
      get :report, employeeId: @employee.employee_card_id
      response.should be_success
      response.status.should == 200
      response.should render_template("report")
      assigns(:employee).should == @employee
    end
  end
end
