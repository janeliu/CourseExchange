# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

root = Dir.pwd
filepath = '/db/seed_colleges.txt'
path = root + filepath

# Seed ingredients data
College.delete_all
open(path) do |seed_colleges|
  seed_colleges.read.each_line do |seed_college|
    name = seed_college.chomp
    College.create!(:name => name)
  end  
end



