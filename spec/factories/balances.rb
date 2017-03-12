FactoryGirl.define do
  factory :balance do
    amount 100
    planned_amount 25
    user
  end
end