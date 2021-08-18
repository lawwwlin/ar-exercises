require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true }
  validates_associated :stores
end

class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true }
  validates :annual_revenue, numericality: { greater_than: 0 }
  validate :carry_mens_or_womens_apparel

  def carry_mens_or_womens_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "Stores must carry at least one of the men's or women's apparel")
      errors.add(:womens_apparel, "Stores must carry at least one of the men's or women's apparel")
    end
  end
end

puts "Enter store name: ";
store_name = gets.chomp;
store = Store.create(name: store_name, womens_apparel: true);
puts store.errors.messages;
