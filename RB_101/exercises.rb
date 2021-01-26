=begin
Write a method that returns true if its integer argument is palindromic, false otherwise.
A palindromic number reads the same forwards and backwards.

examples:
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true

input: integer
output: boolean

explicit:
          - return true if integer is palindromic
implicit:
          - single digit is true

- define method
  - palindromic_number?(int)
- reverse the number
  - save to variable
- compare reversed to original
- use implicit return value
=end

num = 00001088.to_s
p num
# str_num = num.to_s
# no_0 = str_num.sub(/^0/, '')
# p no_0
# def palindrome?(str)
#   str == str.reverse
# end

# def palindromic_number?(int)
#   # reversed = int.to_s.reverse.to_i
#   # int == reversed
#   palindrome?(int.delete.to_s)
# end

# puts palindromic_number?(34543) == true
# puts palindromic_number?(123210) == false
# puts palindromic_number?(22) == true
# puts palindromic_number?(5) == true

=begin
Write another method that returns true if the string passed as an argument is a palindrome, false otherwise.
This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters.

input: string
output: boolean

examples:
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

explicit:
          - return true if the arguement passed is the same forwards and backwards
          - return false if it is different
          - case-insensitive
          - ignore all non-alphanumeric characters
implicit:
          - none

- define a method
  - real_palindrome?(string)
- create a variable for the modified string
  - make lowercase
  - remove non-alphanumeric characters
  - remove spaces
compare the modified string to the modified, reversed string
- use explicit return value
=end
# def palindrome?(str)
#   str == str.reverse
# end

# def real_palindrome?(str)
#   modified_str = str.downcase.delete('^a-z0-9')
  
#   palindrome?(modified_str)
# end

# puts real_palindrome?('madam') == true
# puts real_palindrome?('Madam') == true           # (case does not matter)
# puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# puts real_palindrome?('356653') == true
# puts real_palindrome?('356a653') == true
# puts real_palindrome?('123ab321') == false
=begin
Write a method that returns true if the string passed as an argument is a palindrome,
false otherwise. A palindrome reads the same forward and backward.
For this exercise, case matters as does punctuation and spaces.

input: string
output: boolean

explicit: - case sensitive
          - punctuation and spaces matter
          - string reads the same forwards and backwards
implicit: none

- create method with one input parameter
- reverse input and compare to original word
- no need for return - using implicit

Write a method that determines whether an array is palindromic;
that is, the element values appear in the same sequence both forwards and backwards in the array.

input: array
output: boolean

explict: - compare element values
implicit: input is a string

- take input array and convert it to a string?
  - join
- compare forward string with reversed string
- use implicit return
=end

# def palindrome?(input)
  
#   begin # array operation
#     non_reversed_array = input.join.delete(' ')
#     reverse_array = input.join.delete(' ').reverse
    
#     non_reversed_array == reverse_array
#   rescue NoMethodError
#     joined = input.delete(' ')
#     reversed = input.delete(' ').reverse
#     joined == reversed
#   end
# end

# puts palindrome?('hello there') == false
# puts palindrome?('hello olleh') == true
# puts palindrome?(['att', 't', ' ta']) == true
# puts palindrome?(['hello', 'there']) == false
# puts palindrome?('madam') == true
# puts palindrome?(['madam']) == true
# def palindrome?(array)
#   arr_to_string = array.join
#   arr_to_string == arr_to_string.reverse
# end

# puts palindrome?(['a', 'b', 'a']) == true
# puts palindrome?(['a', 'b,', 'c']) == false
# def palindrome?(string)
#   string == string.reverse
# end

# puts palindrome?('madam') == true
# puts palindrome?('Madam') == false          # (case matters)
# puts palindrome?("madam i'm adam") == false # (all characters matter)
# puts palindrome?('356653') == true

=begin
Write a method that returns an Array that contains every other element of an Array that is passed in as an argument.
The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the
argument Array.

input: an array
output: an array

examples:
  oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
  oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
  oddities(['abc', 'def']) == ['abc']
  oddities([123]) == [123]
  oddities([]) == []

explicit:
          - return an array with OOE of the array passed in ex. 1st, 3rd, 5th
implicit:
          - works with all data types
          - if there is only one element in the array, return the array
          - if the array is empty, return an empty array

- create a method named oddities that takes one parameter
- make a new, empty array named output_arr
- if the input contains 1 or zero elements, make the new array equal the input array
- make a counter that equals 0
- add the element at the array index that equals the counter to output_arr
- increment the counter by 2 each iteration
- repeat until you reach the end of the input array
- return the output_arr

- use each_with_index and while
=end

# def oddities(array)
#   output_arr = []

#   array.each_with_index do |ele, idx|
#     if idx.even?
#       output_arr << ele
#     end
#   end

#   output_arr
# end

# puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# puts oddities(['abc', 'def']) == ['abc']
# puts oddities([123]) == [123]
# puts oddities([]) == []
# def evens(array)
#   output_arr = []

#   counter = 1
#   while counter < array.size
#     output_arr << array[counter]
#     counter += 2
#   end

#   output_arr
# end

# puts evens([2, 3, 4, 5, 6]) == [3, 5]
# puts evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
# puts evens(['abc', 'def']) == ['def']
# puts evens([123]) == []
# puts evens([]) == []

# def oddities(array)
#   output_arr = []
#   if array.size <= 1
#     output_arr = array
#     return output_arr
#   end

#   counter = 0
#   while counter < array.size
#     output_arr << array[counter]
#     counter += 2
#   end

#   output_arr
# end

=begin
- create a method named oddities that takes one parameter
- make a new, empty array named output_arr
- make a counter that equals 0
- if the counter is an even number, add element to the array
- increment the counter by 2 each iteration
- repeat until you reach the end of the input array
- return the output_arr
=end
# require 'pry'
# def oddities(array)
#   output_arr = []

#   counter = 0
#   until counter == array.size do
#     puts counter
#     binding.pry
#     # if counter.even?
#     #   output_arr << array[counter]
#     # end
#     counter += 2
#   end

#   output_arr
# end

# puts oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
# puts oddities([1, 2, 3, 4, 5, 6]) #== [1, 3, 5]
# puts oddities(['abc', 'def']) #== ['abc']
# puts oddities([123]) #== [123]
# puts oddities([]) #== []
=begin
The || operator returns a truthy value if either or both of its operands are truthy,
a falsey value if both operands are falsey. The && operator returns a truthy value
if both of its operands are truthy, and a falsey value if either operand is falsey.
This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

In this exercise, you will write a function named xor that takes two arguments,
and returns true if exactly one of its arguments is truthy, false otherwise.
Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

input: 2 arguments that evaluate to truthy or falsy
output: boolean

explicit:
          - write a function that takes in two arguements
          - returns true if ONLY one of its arguements is truthy
          - returns false if both evaluate truthy
          - returns false if both evaluate falsy
          - || returns true if either of its operands is true, false if not
          - && returns true only if both of its operands are true, false otherwise
implicit: 
          - false if true && true
          - false if false && false
(true && true) && (false && false)

input:  (true, false) => true || false == true
        (false, true) => false || true == true
        (true, true)  => false || false == false
        (false, false)=> false || false == false

  1        2                 2        1
(true && false)     ||    (false && true)
both true == false        both true == false
both false == false       both false == false
true && false == true     false && true == true
false && true == false    true && false == false
=end
# def xor?(input1, input2)
#   # (!input1 && input2) || (input1 && !input2)
#   return true if input1 && !input2
#   return true if !input1 && input2
#   false
# end

# puts xor?(5.even?, 4.even?) == true
# # (true, true) || (false, false) true
# puts xor?(5.odd?, 4.odd?) == true
# # (false, false) || (true, true) == true
# puts xor?(5.odd?, 4.even?) == false
# # (false, true) == false || (true, false) == false => false
# puts xor?(5.even?, 4.odd?) == false
# # (true, false) == false || (false, true) == false => false

=begin
  - Input: 2 integers
  - Output: integer

  Explicit:
            - 2 integers are multiplied together and the integer value returned
  Implicit:
            - The output is an integer
            - method takes in 2 arguments: Integers
  
=end

# def multiply(num1, num2)
#   num1 * num2
# end

# def powers(n,power)
#   multiply(n, power)
# end

# puts powers(3, 3)
=begin
  - Input: string
  - Output: string with char count in it

  - Explicit:
              - One or more words
              - Spaces aren't counted
  - Implicit:
              - Punctuation counts a chars
              - Return the original string with the char count
              - The original string is returned with quotes around it

  - get string from user
    - Prompt the user, then use gets
  - store it in a variable
    - Put it in string var
  - remove the spaces and store the results in a variable
    - First use split without any arguments
    - Chain with join, without any arguments
    - count the chars use length method
  - put result in a variable
    - put it in count variable
  - output the count in a sentence
    - Use string interpolation
    - escape out the inner quotes
=end

# def count_chars
#   puts 'Please enter a word or words: '
#   string = gets.chomp

#   string_count = string.delete(" ").length

#   puts "There are #{string_count} characters in the string \"#{string}\"."
# end

# count_chars

# - if year is evenly divisible by 4 and evenly divisible by 100 it is not a leap year 
# else
# - if year is evenly divisible by 4 and not evenly divisible by 100 it is a leap year

# - if year is evenly divisible by 100 and is divisible evenly by 400 it is a leap year 
# else 
# - if year is evenly divisible by 100 and not evenly divisible by 400 it is not a leap year 

# def leap_year?(year)
#   if year % 2 != 0
#     return false
#   elsif year % 4 == 0 && year % 100 == 0 && year % 400 != 0
#     return false
#   end
#   true
# end

# puts leap_year?(2016) == true
# puts leap_year?(2015) == false
# puts leap_year?(2100) == false
# puts leap_year?(2400) == true
# puts leap_year?(240000) == true
# puts leap_year?(240001) == false
# puts leap_year?(2000) == true
# puts leap_year?(1900) == false
# puts leap_year?(1752) == true
# puts leap_year?(1700) == false
# puts leap_year?(1) == false
# puts leap_year?(100) == false
# puts leap_year?(400) == true 



# p ">> Please enter the first number:"
# first = gets.chomp.to_i
# p ">> Please enter the second number:"
# second = gets.chomp.to_i

# puts ">> #{first} + #{second} == #{first + second}"
# puts ">> #{first} - #{second} == #{first - second}"
# puts ">> #{first} * #{second} == #{first * second}"
# puts ">> #{first} / #{second} == #{first / second}"
# puts ">> #{first} % #{second} == #{first % second}"
# puts ">> #{first} ** #{second} == #{first ** second}"

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")

#   return false if dot_separated_words.size != 4
#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     return false unless is_an_ip_number?(word)
#   end
#   return true
# end



# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param << "rutabaga"

#   return a_string_param, an_array_param
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# my_string, my_array = tricky_method(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# def factors(number)
#   divisor = number
#   factors = []
#   while divisor > 0
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end

#   factors
# end

# puts factors -1

# 10.times { |i| puts " " * i + 'The Flintstones Rock!'}

# def print_total
#   def compute_sum(int)
#     total = (1..int).inject(:+)
#   end
  
#   def compute_product(int)
#     total = (1..int).inject(:*)
#   end

#   num = 0
#   loop do
#     puts ">> Please enter an integer larger than 0:"
#     num = gets.chomp.to_i
#     break if num.integer? && !num.zero?
#     puts 'Invalid input. Please try again.'
#   end

#   operation = ''
#   loop do
#     puts "Enter 's' to compute sum, or 'p' to compute product"
#     operation = gets.chomp
#     break if operation.start_with? 's', 'p'
#     puts 'Invalid input. Please try again.'
#   end

    
#     case operation
#     when 's'
#       total = compute_sum(num)
#       puts "The sum of all the numbers between 1 and #{num} is #{total}."
#     when 'p'
#       total = compute_product(num)
#       puts "The product of all the numbers between 1 and #{num} is #{total}."
#     end
# end

# print_total

# def evens
#   1.upto(99) {|i| puts i if i.even?}
# end

# evens

# def hello
#   puts "What is your name?"
#   name = gets.chomp

#   if name.end_with?('!')
#     name.slice!(-1)
#     puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
#   else
#     puts "Hello #{name}."
#   end
# end

# hello

# def retire
#   current_year = Time.now.year

#   puts 'What is your age?'
#   age = gets.chomp.to_i
#   puts 'At what age would you like to retire?'
#   retire_age = gets.chomp.to_i

#   years_to_retire = retire_age - age
#   retire_year = current_year + years_to_retire

#   puts "It's now #{current_year}"
#   puts "You only have #{years_to_retire} years until retirement"
#   puts "It will be #{retire_year} when you retire"
# end

# retire

# def tip_calc
#   puts 'What is the bill?'
#   bill = gets.chomp.to_f
#   puts 'What is the tip percentage?'
#   tip_percent = gets.chomp.to_f
#   tip = bill * (tip_percent / 100)
#   total = bill + tip

#   puts "The tip is $#{format('%.2f', tip)}"
#   puts "The bill total is $#{format('%.2f', total)}"
# end

# tip_calc

# SQIN_TO_SQCM = 6.4516

# def sq
#   puts 'Please enter the width:'
#   width = gets.chomp.to_f
#   puts 'Please enter the length:'
#   length = gets.chomp.to_f

#   sq_ft = length * width
#   sq_in = sq_ft * 12
#   sq_cm = sq_in * SQIN_TO_SQCM

#   puts "The area of the room is #{sq_ft.round(2)} square feet (#{sq_in.round(2)}" \
#        " square inches) (#{sq_cm.round(2)} square centimeters)"
# end

# sq

# def age()
#   puts 'Please enter your name:'
#   name = gets.chomp
#   name = 'Teddy' if name.empty?
#   age = rand(20..200)
#   puts "#{name} is #{age}"
# end

# age