# Creates default admin

Employee.create!(
  employee_card_id: "123a456b",
  first_name: "Default",
  last_name: "Admin",
  is_admin: true
)
