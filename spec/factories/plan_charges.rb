# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plan_charge do
    amount 1.5
    plan
    user
  end
end
