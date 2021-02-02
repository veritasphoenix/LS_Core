=begin
Write a method that takes an integer, and converts it to a string representation.

input: int
output: string representation of the int

extrinsic:
          - can't use conversion methods
intrinsic:
          - positive int strings return signed, whether they are negative or positive
          - 0 gets returned as '0'

- try case statement
=end

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''

  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when 1 then "+#{integer_to_string(number)}"
  else integer_to_string(number)
  end
end

# def signed_integer_to_string(number)
#   case number
#   when number == 0
#     '0'
#   when number < 0
#     number *= -1
#     "-#{integer_to_string(number)}"
#   else
#     "#{integer_to_string(number)}"
#   end
  # if number == 0
  #   return '0'
  # elsif number < 0
  #   number *= -1
  #   return "-#{integer_to_string(number)}"
  # else
  #   return "+#{integer_to_string(number)}"
  # end
# end
puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

=begin
Write a method that takes a positive integer or zero, and converts it to a string representation.

input: int
output: string version of int

- variable to hold the string
  - shovel results into string
- break up int into individual numerals
  - #digits --> returns an array of each digit
- use hash to convert to string
=end

# INT_DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#               '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

# def integer_to_string(int)
#   int_str = ''
#   int.digits.each do |digit|
#     int_str << INT_DIGITS.key(digit)
#   end

#   int_str.reverse
# end
# DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# def integer_to_string(number)
#   result = ''

#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(DIGITS[remainder])
#     break if number == 0
#   end
#   result
# end

# puts integer_to_string(4321) == '4321'
# puts integer_to_string(0) == '0'
# puts integer_to_string(5000) == '5000'
=begin
Write a method that takes a String of digits, and returns the appropriate number as an integer.

input: str
output: signed int

explicit:
          - input string may or may not have a leading `"+"` or `"-"`
          - if it doesn't have any sign in front, assume it's positive
          - can't use `String#to_i` or `Integer()`, or any conversion methods
          - assume string is a valid number
implicit: none

- define method string_to_signed_integer that takes in one arguement
- create output_int variable
- create a variable called `power` and set it equal to the return value of `str_int.length - 1`
- create a `negative` method and set it to `false`
- create hash with string-int conversions
- split input string into chars
- check to see if the first char is a `"+"` or a `"-"`
  - `#include?('+', '-`)
  - if it is a `"-"`, make the `negative` variable `true`
- if it has either char, remove it
- procede like before 
- if it has a minus, multiply result by -1
=end

# def negative?(char)
#   '-'.include? char
# end

# STRING_INTS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
#                 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

# def string_to_signed_integer(str_int)
#   output_int = 0
#   int_arr = str_int.chars
#   negative = negative?(int_arr[0])

#   int_arr.shift if ['+', '-'].include?(int_arr[0])

#   power = int_arr.size - 1
  
#   int_arr.each do |char|
#     output_int += STRING_INTS.key(char) * 10.pow(power)
#     power -= 1
#   end
  
#   output_int *= -1 if negative

#   output_int
# end
# STRING_INTS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
#   5 =>'5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

# def string_to_integer(str_int)
# output_int = 0
# str_array = str_int.chars
# digit_power = str_int.length - 1

# str_array.each do |char|
# output_int += STRING_INTS.key(char) * 10.pow(digit_power)
# digit_power -= 1
# end

# output_int
# end

# def string_to_signed_integer(str_int)
#   case str_int[0]
#   when '-' then -string_to_integer(str_int[1..-1])
#   when '+' then string_to_integer(str_int[1..-1])
#   else string_to_integer(str_int)
#   end
# end

# puts string_to_signed_integer('4321') == 4321
# puts string_to_signed_integer('-570') == -570
# puts string_to_signed_integer('+100') == 100

=begin
Write a method that takes a String of digits, and returns the appropriate number as an integer. 

input: string object
output: integer object

explicit:
          - can't use #to_i or Integer() constructor
          - a string number is input, the output is the string converted to an integer
          - don't worry about signed numbers
implicit: none

- create a method string_to_integer that has one parameter
- create an output variable for the int
  - initialize it to 0
- create a hash that has the int as the key and the string as the value
  - hash can be a constant
- separate the string into its individual chars
  - #chars
- iterate through each char
  - #each
- find the corresponding key in the hash
  - Hash#key
- add the integer to the end of the output int
  - since ints are not mutable, multiply each value by 10**(-index location)
  - add it to the result variable
- repeat for the rest of the chars
- return the final integer
=end
# STRING_INTS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
#   5 =>'5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

# def string_to_integer(str_int)
# output_int = 0
# str_array = str_int.chars
# digit_power = str_int.length - 1

# str_array.each do |char|
# output_int += STRING_INTS.key(char) * 10.pow(digit_power)
# digit_power -= 1
# end

# output_int
# end

# puts string_to_integer('4321') == 4321
# puts string_to_integer('570') == 570

=begin
  a = 10, b = 11, c = 12, d = 13, e = 14, f = 15
=end
# STRING_INTS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
#                 5 =>'5', 6 => '6', 7 => '7', 8 => '8', 9 => '9',
#                 10 => 'a', 11 => 'b', 12 => 'c', 13 => 'd', 14 => 'e', 15 => 'f' }

# def hexadecimal_to_integer(hex_str)
#   output_int = 0
#   str_array = hex_str.chars
#   power = hex_str.length - 1

#   str_array.each do |char|
#     output_int += STRING_INTS.key(char.downcase) * 16.pow(power)
#     power -= 1
#   end
#   output_int
# end

# puts hexadecimal_to_integer('4D9f') == 19871
=begin
f = 15 x 16^0 = 15
9 = 9 x 16^1 = 144
D = 13 x 16^2 = 3328
4 = 4 x 16^3 = 16384
=end

=begin
Write a method that takes an Array of numbers, and returns an Array with the same number of elements,
and each element has the running total from the original Array.

input: an array of ints
output: an array of ints, the same length as input array

explicit:
          - returned array has same number of elements as input array
          - returned array elements are the running total of the input array elements
implicit:
          - if an empty array is given, return an empty array
          - if an array with a single element is given, return that array
          - the first element of the return array is always the first element of the imput array

- create a method nameed running_total that takes in 1 arguement - an array
- create an output array named totals
- the sum of the first and second elements of the input array get assigned to the second element of the output array
- the third element of the input array is added to either the previous array elemtnts, or to the last element of the
  output array
- repeat until you get to the end of the input array
- return the output array
=end

# def running_total(array)
  # output = [array[0]]
  # counter = 1

  # return array if array.length == 0

  # while counter <= array.length - 1
  #   output << array[counter] + output.last
  #   counter += 1
  # end

  # output
  # each_with_object - pass in an object
  # return array if array.empty?
  # sum = 0
  # array.each_with_object([]) do |ele, arr|
  #  sum += ele
  #  arr << sum
  # end
  # # p new_arr
  # # we use map because we need to do an operation on an array, and then output a new array with the results
  
  # # sum = 0
  # # array.map { |int| sum += int}
#   new_arr = []
#   array.inject([]) do |sum, arr|
#     running_tot = [sum]
#     sum = running_tot + ele
#   end
# end

# puts running_total([2, 5, 13]) == [2, 7, 20]
# puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# puts running_total([3]) == [3]
# puts running_total([]) == []

=begin
Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number,
and then computes the sum of those multiples.
For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

input: integer
output: integer

explicit:
          - find the sum of all the digits that are mult of 3 or 5
          - number passed in will be > 1

implicit:
          - the range is inclusive of number input
          - there will be no 1 or 2
          - numbers are only added once, even if they are divisable by 3 and 5

- create a method named multisum
- create an array to hold the multiples names multiples
- iterate through all of the digits between 3 and input number
  - use range?
  - shovel in current num if num % 3 or num % 5
- sum the ints in array
  - use .sum method
- return the sum
  - use return value from .sum
=end

# def multisum(num)
#   # multiples = []

#   # (1..num).each do |int|
#   #   multiples << int if int % 3 == 0 || int % 5 == 0
#   # end

#   # multiples.sum

#   (1..num).inject(0) do |sum, int|
#     sum += int if (int % 3 == 0 || int % 5 == 0)
#     sum
#   end
# end

# puts multisum(3) == 3
# puts multisum(5) == 8
# puts multisum(10) == 33
# puts multisum(1000) == 234168
=begin
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4,
unless the year is also divisible by 100. If the year is evenly divisible by 100,
then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input,
and returns true if the year is a leap year, or false if it is not a leap year.

input: integer
output: boolean

explicit:
          - is leap year if:
            1. the year is divisible by 4, unless it is also divisible by 100
            2. if the year is divisible by 100, it is a leap year if it is also divisible by 400
          - year will be greater than 0
          - return true if year is a leap year, false otherwise
          - year can be any length
implicit: none

- check if it is div by 4, if not, return false
- if it is divisable by 4, see if is also divisible by 100
  - if so, is it div by 400 also? if yes, return true
  - if not, return false

That is, test whether the year is divisible by 4 first, then, if necessary, test whether it is divisible by 100,
and finally, if necessary, test whether it is divisible by 400.
=end

# def leap_year?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       if year % 400 == 0
#         return true
#       end
#       return false
#     end
#     return true
#   end
#   return false
# end

# def leap_year?(year)
#   if year < 1752
#     return year % 4 == 0
#   end

#   (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
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
# puts leap_year?(1700) == true
# puts leap_year?(1) == false
# puts leap_year?(100) == true
# puts leap_year?(400) == true
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
=begin
input: integer date
output: string century

explicit:
          - centuries begin at year 01 and end the following 00
          - ending is stuck to the end of the century string
implicit:
          - only string with suffix returned

examples:
          century(2000) == '20th'
          - between 1901 and 2000
          - f: 20 s: 00
          century(2001) == '21st'
          - between 2001 and 2100
          - f: 20 s: 01
          century(1965) == '20th'
          - between 1901 and 2000
          - f: 19 s: 65
          century(256) == '3rd'
          - between 201 and 299
          - f: 2 s: 56
          century(5) == '1st'
          - between 0 and 99
          century(10103) == '102nd'
          - between 10101 and 10200
          - f: 101 s: 03
          century(1052) == '11th'
          - between 1001 and 1100
          - f: 10 s: 52
          century(1127) == '12th'
          - between 1101 and 1200
          - f: 11 s: 27
          century(11201) == '113th'
          - between 11201 and 11300
          - f: 112 s: 01
          
        - if the year is more than 2 digits, remove the last 2 digits
          - if the last 2 digits are 00, the century is the first digit(s)
          - if last 2 digits are 01-99, add 1 to the first digit(s)

- method named century is defined
- if the year is 1-2 digits, it is the first century
- if the year is 3 or more digits:
    - remove the last 2 digits and then add 1 to the remaining number

st: 1st, 21st, etc (Not 11th)
nd: 2nd, 22nd, etc (Not 12th)
rd: 3rd, 23rd, etc
th: all others, incl 11th, 12th
=end
# def century_with_suffix(century)
#   if century.end_with?('11')
#     return '11th'
#   elsif century.end_with?('12')
#     return '12th'
#   elsif century.end_with?('13')
#     return "#{century}th"
#   elsif century.end_with?('1')
#     return "#{century}st"
#   elsif century.end_with?('2')
#     return "#{century}nd"
#   elsif century.end_with?('3')
#     return "#{century}rd"
#   else
#     return "#{century}th"
#   end
# end

# def century(year)
#   first_digits = year.to_s.slice(0..-3)
#   last_2_digits = year.to_s.slice(-2, 2)
#   cent = nil

#   if year.between?(0, 100)
#     cent = '1'
#   elsif last_2_digits == '00'
#     cent = first_digits
#   else
#     cent = (first_digits.to_i + 1).to_s
#   end
  
#   century_with_suffix(cent)
# end

# puts century(2000) == '20th'
# puts century(2001) == '21st'
# puts century(1965) == '20th'
# puts century(256) == '3rd'
# puts century(5) == '1st'
# puts century(10103) == '102nd'
# puts century(1052) == '11th'
# puts century(1127) == '12th'
# puts century(11201) == '113th'
# def short_long_short(str1, str2)
#   if str1.length > str2.length
#     str2 + str1 + str2
#   else
#     str1 + str2 + str1
#   end
# end

# puts short_long_short('abc', 'defgh') == "abcdefghabc"
# puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
# puts short_long_short('', 'xyz') == "xyz"
