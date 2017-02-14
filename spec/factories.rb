FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@mail.com" }
    password "Foobar123"
  end

  factory :category do
    name "clothes"
    user 
  end
end
