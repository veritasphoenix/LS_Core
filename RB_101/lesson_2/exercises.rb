def calculate_bonus(int, bool)
  bool ? int / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

# def sum(int)
#   # int.digits.sum
#   str_arr = int.to_s.chars
#   str_arr = str_arr.map(&:to_i).reduce(:+)
# end

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# def average(arr)
#   # arr.sum / arr.size
#   arr.reduce(:+).to_f / arr.size
# end

# puts average([1, 6]) # 3 integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) # 25
# puts average([9, 47, 23, 95, 16, 52]) # 40

=begin
  Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s,
  always starting with 1. The length of the string should match the given integer.

  - create a variable that is initialized to 1
  - create a new string that will hold the resulting string
  - call the times method on the integer arguement
    - on each iteration, the method will add the value of the variable to the end of the string
    - create an if statement that changes the 1 to 0, or 0 to 1
  - return the new string
=end

# def stringy(input_int, starting_num = 1)
#   increment_num = input_int
#   arr = []
#   num_to_add_rotating = [1,0].cycle # 
#   num_to_add_rotating.next if starting_num == 0

#   until increment_num == 0 do
#       arr << num_to_add_rotating.next
#       increment_num -= 1
#   end

#   arr.join
# end
# def stringy(size, start = 1)
#   # zero_or_one = '1'
#   # zero_or_one_string = ''

#   # int.times do
#   #   if zero_or_one == '1'
#   #     zero_or_one_string << zero_or_one
#   #     zero_or_one = '0'
#   #   else
#   #     zero_or_one_string << zero_or_one
#   #     zero_or_one = '1'
#   #   end
#   # end
#   # zero_or_one_string
#   numbers = []

#   size.times do |index|

#     if start == 1
#       number = index.even? ? 1 : 0
#       numbers << number
#     else
#       number = index.even? ? 0 : 1
#       numbers << number
#     end
#   end

#   numbers.join('')
# end

# puts stringy(4, 0)
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# def reverse_words(str)
#   words = []

#   str.split.each do |word|
#     word.reverse! if word.size >= 5
#     words << word
#   end
  
#   words.join(' ')
# end

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# def reverse_sentence(str)
#   new_str = str.split.reverse.join(' ')

#   # str_arr = str.split
#   # rev_arr = []

#   # while str_arr.length > 0
#   #   rev_arr << str_arr.pop
#   # end
  
#   # new_str = rev_arr.join(' ')
# end

# puts reverse_sentence("Hello World there")
# def count_vehicles(arr)
#   count = Hash.new(0)

#   arr.each do |ele|
#     count[ele.downcase] += 1
#   end

#   count
# end

# vehicles = [
#   'Car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# p count_vehicles(vehicles)

# def digit_list(number)

# end

# p digit_list(12345)

# def separate_num(num)
#   num_str = num.to_s
#   new_str = num_str.split('').map do |ele|
#     ele.to_i
#   end
# end

# p separate_num(12345)

# def odd?(num)
#   num.remainder(2).abs == 1
# end

# puts odd?(-3)

# def repeat(str, mult)
#   mult.times do
#     puts str
#   end
# end

# repeat "hello", 3