# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
2.times do |n|
  locker_prefix = "sm-#{n+1}"
  locker = Locker.create!(
    size_code: 1,
    locker_no: locker_prefix
  )
end

2.times do |n|
  locker_prefix = "md-#{n+1}"
  locker = Locker.create!(
    size_code: 2,
    locker_no: locker_prefix
  )
end

2.times do |n|
  locker_prefix = "lg-#{n+1}"
  locker = Locker.create!(
    size_code: 3,
    locker_no: locker_prefix
  )
end
