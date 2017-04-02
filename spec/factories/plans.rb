# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plan do
    name "MyString"
    start_date "2017-02-28"
    end_date "2017-02-28"
    amount 100
    user
    category
  end
end
