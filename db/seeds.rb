# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "........................"
Theme.create([{ name: 'default' }, { name: 'activo' }, { name: 'amro' }, { name: 'bec' }, { name: 'bec-green' }, 
              { name: 'blue' }, { name: 'djime-cerulean' }, { name: 'drastic-dark' }, { name: 'kathleene' }, 
              { name: 'olive' }, { name: 'orange' }, { name: 'red' }, { name: 'reidb-greenish' }, { name: 'warehouse' }])
puts "Done"