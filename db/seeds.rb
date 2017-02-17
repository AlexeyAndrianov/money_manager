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

for i in 1..5 do
  user = User.create(email: "user#{i}@test.com", password: "qwe123", password_confirmation: "qwe123")
  create_categories_for_user(user)
end


