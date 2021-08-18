require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  belongs_to :store
end

class Store < ActiveRecord::Base
  has_many :employees
end

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "John", last_name: "Doe", hourly_rate: 10)
@store1.employees.create(first_name: "Jane", last_name: "Doe", hourly_rate: 12)

@store2.employees.create(first_name: "Lawrence", last_name: "Lin", hourly_rate: 100)
@store2.employees.create(first_name: "Amy", last_name: "Ko", hourly_rate: 110)
@store2.employees.create(first_name: "Bryan", last_name: "Lin", hourly_rate: 100)