# def car(new_car)
#   make = make(new_car)
#   model = model(new_car)
#   [make, model]
# end

# def make(new_car)
#   new_car.split(" ")[0]
# end

# def model(new_car)
#   new_car.split(" ")[2]
# end

# make, model = car("Ford Mustang")
# make == "Ford"         # => true
# model.start_with?("M") # => NoMethodError: undefined method `start_with?' for nil:NilClass

# require "pry"

# counter = 0

# loop do
#   counter += 1
#   binding.pry
#   break if counter == 5
# end

# (1..10)                 .tap { |x| p x }   # 1..10
#  .to_a                  .tap { |x| p x }   # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#  .select {|x| x.even? } .tap { |x| p x }   # [2, 4, 6, 8, 10]
#  .map {|x| x*x }        .tap { |x| p x }   # [4, 16, 36, 64, 100]

# input = gets.chomp
# x = Integer(input) rescue false
# if x
#     puts "It's an integer"
# else
#     puts "It's a string"
# end

# file = File.open("messages.rb")
# file_data = Hash[*File.read('messages.txt').split("\n")]
# file_data = *File.read('messages.txt').split(/[","]/)
messages_hash = Hash[File.read('messages.txt').split("\n").map{|i|i.split(', ')}]
puts messages_hash['2']
