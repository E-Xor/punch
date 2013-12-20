FactoryGirl.define do

  factory :clock_record_in, class: ClockRecord do
    employee_id 1
    clocked_in true
    created_at { 1.hour.ago }
  end

  factory :clock_record_out, class: ClockRecord do
    employee_id 1
    clocked_in false
    created_at { 1.minute.ago }
  end
end
