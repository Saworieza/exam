# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: 'm_p330', password: '123456', password_confirmation: '123456')

group_1 = Group.create!(name: 'Group 1')
group_2 = Group.create!(name: 'Group 2')
group_3 = Group.create!(name: 'Group 3')
group_4 = Group.create!(name: 'Group 4')

Clazz.create!(group: group_1, name: 'CS 5329')
Clazz.create!(group: group_2, name: 'CS 5346')
Clazz.create!(group: group_2, name: 'CS 5391')
Clazz.create!(group: group_3, name: 'CS 5332')
Clazz.create!(group: group_3, name: 'CS 5310')
Clazz.create!(group: group_4, name: 'CS 5338')
Clazz.create!(group: group_4, name: 'CS 5318')
Clazz.create!(group: group_4, name: 'CS 5351')

Result.create!(name: 'noshow')
Result.create!(name: 'passed')
Result.create!(name: 'failed')
