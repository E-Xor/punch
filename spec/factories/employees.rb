FactoryGirl.define do
  factory :employee do
    sequence(:employee_card_id) {|n| "098z#{n}654x#{n}" }
    sequence(:first_name) {|n|  "Userjoe#{n}" }
    sequence(:last_name) {|n|  "Defaultdoe#{n}" }
    is_admin false
  end

  factory :admin, class: Employee do
    sequence(:employee_card_id) {|n| "198s#{n}652d#{n}" }
    sequence(:first_name) {|n|  "Adminjoe#{n}" }
    sequence(:last_name) {|n|  "Coolerdoe#{n}" }
    is_admin true
  end
end
