# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

# SEED TEST LOCATIONS
locations = CreateTestLocationsService.new.call
locations.each do |loc|
  OpeningRule.weekdays.each do |weekday_name, weekday_value|
    opening_type = [:a,:b,:c,:d].sample
    case opening_type
      when :a
        loc.opening_rules.create! weekday: weekday_name, start_time: "08:00", end_time: "12:00"    
        loc.opening_rules.create! weekday: weekday_name, start_time: "16:00", end_time: "18:00"    
      when :b
        loc.opening_rules.create! weekday: weekday_name, start_time: "00:00", end_time: "23:59"    
      when :c
        loc.opening_rules.create! weekday: weekday_name, start_time: "08:00", end_time: "20:00"    
      when :d
    end
  end
end

puts "LOCATIONS:"
puts locations.as_json(include: {opening_rules: {only: [:weekday,:start_time,:end_time]}}).pretty_inspect


