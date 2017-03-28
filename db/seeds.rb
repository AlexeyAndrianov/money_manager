# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def self.create_categories_for_user(user)
  ['clothes', 'food', 'devices', 'rent'].each do |category_name|
    Category.create(name: category_name, user_id: user.id)
  end
end

def self.create_charges_for_user(user)
  Charge.create(operation_date: Date.today, amount: 10, description: "na nalog", user_id: user.id)
end

def self.plans_for_user(user)
  Plan.create(start_date: Date.today, end_date: Date.today, amount: 10, user_id: user.id, category: food)
end

def self.create_plan_charges_for_user(user)
  Plan_charge.create(operation_date: Date.today, amount: 1, description: "moar money", user_id: user.id)
end

def self.create_plans_for_user(user)
  { 'Bike' => 2500, 'Macbook' => 2000, 'Phone' => 700 }.each do |plan_name, amount|
    Plan.create(
      name: plan_name,
      amount: amount,
      start_date: Date.today,
      end_date: Date.today + (1 + rand(4)).month,
      user: user,
      category: user.categories.find_by(name: 'devices')
    )
  end
end


ActiveRecord::Base.transaction do
  for i in 1..5 do
    user = User.create(email: "user#{i}@test.com", password: "qwe123", password_confirmation: "qwe123")
    create_categories_for_user(user)
    create_charges_for_user(user)
    create_plans_for_user(user)
  end
end