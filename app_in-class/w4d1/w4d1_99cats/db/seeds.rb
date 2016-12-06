# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cat1 = Cat.create!(birth_date: '2014/01/20', name: 'Curly', sex: 'M')
cat2 = Cat.create!(birth_date: '2012/6/26', name: 'Bobby', sex: 'F')
