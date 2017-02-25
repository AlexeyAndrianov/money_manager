FactoryGirl.define do
  factory :charge do
    amount 10
    description "zarplata"
    operation_date Date.today
    user
  end
end
