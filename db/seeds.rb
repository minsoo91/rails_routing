# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create!(username: Faker::Internet.user_name)
end

User.all.each do |user|
  3.times do
    Contact.create!(name: Faker::Name.name, email: Faker::Internet.email, user_id: user.id)
  end
end

User.all.each do |user|
  Contact.all.each do |contact|
    ContactShare.create!(user_id: user.id, contact_id: contact.id)
  end
end