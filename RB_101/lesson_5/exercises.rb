
  # rest of data
]

=begin
Write a method that returns one UUID when called with no parameters.

input: none
output: ine UUID

explicit:
          - write a method that takes no parameters
          - returns a single UUID
          - formatted: 8-4-4-4-12
implicit:
          - returns a string

example:
        "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

- create a method that takes no parameters
  - named 'gen_uuid'
- create a variable named uuid and assign it to an empty string
- first section has 8 hex chars
  - randomly generate an 8-digit hex string
    - Random#alphanumeric
  - assign a variable to it
- sections 2-4 have 4 hex chars
  - same as above
- the last section has 12 hex chars
  - same as above
- separated by '-'
  - maybe string concatination with the above variables?
- return uuid

=end
def gen_uuid
  characters = []

  (0..9).each { |num| characters << num.to_s }
  ('a'..'z').each { |char| characters << char}

  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

puts gen_uuid

=begin
Given this data structure write some code to return an array which contains only the hashes
where all the integers are even.

input: array of hashes
output: array

explicit:
          - output array only contains hashes where all the integers are even
implicit:
          - input array contains hashes
            - hash keys are symbols
            - hash values are arrays
          - hash lengths vary in size

correct output:
                [{e: [8], f: [6, 10]}]

- iterate through the outer array
  - maybe use map because I need to output an array?
  - maybe select - use the true return value from all? to select hash
- check to see if the hash at each element only contains integer values
  - iterate through the inner hashes
    - if all the integers are even, that hash gets added to output array
- if it does, add it to the output array
=end

# arr = [
#   {a: [1, 2, 3]},
#   {b: [2, 4, 6], c: [3, 6], d: [4]},
#   {e: [8], f: [6, 10]}
# ]
# output = []

# arr.each do |hash|
#   output = hash.select do |k, v|
#     v.all? { |int| int.even? }
#   end
#   # each iteration looks at a hash
#   # use something that returns true only if all the elements are even
# end

# p output
=begin
Given this data structure write some code to return an array containing the colors of the fruits and the sizes
of the vegetables. The sizes should be uppercase and the colors should be capitalized.

input: hash
output: array

explicit:
          - The array returned contains the colors of the fruit Capitalized
          - The array returned contains the sizes of the vegetables UPPERCASE
          - 
implicit:
          - order in the array is the order they are in the hash
          - :colors key is an array
          - :size value is a string
          - hsh keys are names of fruits/veg, values are hashes

example:
          [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

- create an empty array to hold the results
  - name it results
- iterate through hsh
  - each
- check if the current iteration is a fruit or veg
  - case statement?
  - if it is a fruit, get the value of the :colors key
    - iterate through the array
      - Capitalize each element
    - add the aray to the results array
  - if it is a veg, get the value of the :sizes key
    - UPPERCASE it
    - add it to the results array
- return the results array
=end

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# results = hsh.map do |_, details|
#   case details[:type]
#   when 'fruit'
#     details[:colors].map { |color| color.capitalize }
#   when 'vegetable'
#     details[:size].upcase
#   end
# end

# # hsh.each_value do |details|
# #   item_type = details[:type]
# #   case item_type
# #   when 'fruit'
# #     results << details[:colors].map { |ele| ele.capitalize }
# #   when 'vegetable'
# #     results << details[:size].upcase
# #   end
# # end

# p results == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
=begin
Given the following data structure, return a new array containing the same sub-arrays as the original
but ordered logically by only taking into consideration the odd numbers they contain

input: array of arrays
output: array of arrays

explicit:
          - return a new array
          - the array contains the same arrays, but ordered logically, considering only the odd numbers
inplicit:
          - the order of the ints inside the sub arrays does not change

example: original => [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
          sorted  => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

- sort by the odd values
- use map to make new array?
- maybe sort by the first element, then by the third?
- sort returns a new array - inside sort returns a new array sorted by the first element
  - that is sorted again, this time by the third element
  - that returns a new array of sub arrays, sorted by the first array, then by the last
=end

# arr = [[3, 2, 1], [1, 8, 3], [1, 6, 7], [1, 4, 9]]
# # new_something = []
# # arr.each do |array|
# #   new_something << array.select do |num|
# #     num.odd?
# #   end
# # end
# #  p new_something
# new_arr = arr.sort_by do |sub_arr|
#   sub_arr.select do |num|
#     num.odd?
#   end
# end

# p new_arr
# arr = [[3, 2, 1], [1, 6, 7], [1, 4, 9], [1, 8, 3]]
# # sort the first elements
# first_sort = arr.sort { |first_a, first_b| first_a[0] <=> first_b[0]}
# # take the array with the first elements sorted, and sort by the third elements
# sorted = first_sort.sort { |a, b| a[2] <=> b[2] }

# puts sorted == [[1, 8, 3], [1, 6, 7], [1, 4, 9], [3, 2, 1]]

=begin
Given the following data structure, and without using the Array#to_h method,
write some code that will return a hash where the key is the first item in each sub array
and the value is the second item.

input: array
output: hash

explicit:
          - can't use Array#to_h method
          - hash key will be the first item in the sub-array
          - hash value will be the second item in the hash array
implicit:
          - items in the input array can be anything
          - items can be any length

- create an empty hash
- iterate through the top level array
  - since we need to access each item in the sub arrays, try each_with_index
  - or hard code the key with [0] and the value with [1]
- take the first item (0) and use it as the key in the new hash
- take the second item (1) and use it as the value in the new hash


example: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
=end

# arr = [
#   [:a, 1],
#   ['b', 'two'],
#   ['sea', {c: 3}],
#   [{a: 1, b: 2, c: 3, d: 4}, 'D']
# ]
# hsh = {}

# arr.each do |ele|
#   hsh[ele[0]] = ele[1]
# end

# p hsh == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

=begin
Given the following data structure use a combination of methods, including either the select or reject method,
to return a new array identical in structure to the original but containing only the integers that are multiples of 3

input: array of arrays
output: new array, identical in structure to the original

explicit:
          - use a combination of methods
          - must use either select or reject
          - returned array must be new and of the same structure as the original
          - new array contains only integers that are a multiple of 3
implicit: none

- iterate through array
- for each integer, see if it is divisable by 3
- keep if it is
- delete only the integer if it is not divisable
=end

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
# new_arr = []

# new_arr = arr.map do |array|
#   array.select do |ele|
#     ele % 3 == 0
#   end
# end

# p new_arr
=begin
- use map

- how to access the hashes?
- what has a return value that map can use?
=end

# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# new_arr = arr.each_with_object([]) do |hsh, array|
#   incremented_hash = {}

#   hsh.each do |key, value|
#     incremented_hash[key] = value + 1
#   end
#   array << incremented_hash
# end

# p new_arr
# new_arr = arr.map do |ele|
#   ele.transform_values { |v| v += 1 }
# end

# p new_arr# 

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# Given this data structure, return a new array of the same structure but with the sub arrays 
# being ordered (alphabetically or numerically as appropriate) in descending order.
# sorted = arr.map do |sub_arr|
#   sub_arr.sort { |a, b| a <=> b }
# end

# p sorted


# hsh = {
#   first: ['the', 'quick'],
#   second: ['brown', 'fox'],
#   third: ['jumped'],
#   fourth: ['over', 'the', 'lazy', 'dog']
# }
=begin
Using the each method, write some code to output all of the vowels from the strings.

input: hash
output: the vowels

explicit:
          - use #each
implicit: none

- select each word, from the array in each key
- find all the vowels
  - #select
- print the vowel, or add to 'vowel' string, then print string
=end
# vowels_array = []

# hsh.each do |_, array|
#   array.each do |ele|
#     # chars = ele.chars
    
#     vowels_array << ele.chars.select { |v| v =~ /[aeiou]/}
#   end
# end
# puts vowels_array.join('')

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

=begin
example: (Name) is a (age)-year-old (male or female).

- maybe each
=end
# munsters.each do |name, details|
#   puts "#{name} is a #{details['age']}-year-old #{details['gender']}."
# end
# figure out the total age of just the male members of the family
=begin
  input: hash
  output: integer of the sum of the males ages

  explicit:
            - Sum the ages of only the males
  implicit: none
  - iterate through each name
  - select the males
    - try select method, targeting the 'age' key
      - returns a hash containing the k/v pairs that were targeted
    - iterate w/ each. add up ages
  - add up their ages
    - inside the select method, add up their ages
  -return the results (implicit? see what select returns)
=end
# age = 0
# munsters.each_value do |details|
#   age += details['age'] if details['gender'] == 'male'
# end
# munsters.each do |k, v|
#   if v['gender'] == 'male'
#     age += v['age']
#   end
# end

# puts age
# arr1 = [1, [2, 3], 4]

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

# hsh1 = {first: [1, 2, [3]]}

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# # For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4

# arr1[1][1] = 4
# p arr1
# arr2[2] = 4
# p arr2
# hsh1[:first][2][0] = 4
# p hsh1
# hsh2[['a']][:a][2] = 4
# p hsh2

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# puts arr1[2][1][3]
# puts arr2[1][:third][0]
# puts arr3[2][:third][0][0]
# puts hsh1['b'][1]
# puts hsh2[:third].key(0)

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

=begin
sort the books by published date from earliest to latest

input: an array of hashes
output: an new array of hashes, sorted by pub date

explicit:
          - return new, sorted array
          - sort by publication date, from earliest to latest
implicit: none

- iterate through books array to access each hash
  - since we need to return a new, sorted array, the map method does that
  - each iteration will select a new hash
  - save the results to a variable
- access the publication date of each book
  - On each iteration, we can access the pub date by referencing the key :published
  - no need to transform date to int, it will search fine b/c they are all the same length
- sort the hashes by that publication date
  - maybe use sort_by?
- return the sorted array
=end
# books.sort_by do |book|
#   book[:published]
# end
# sorted_books = books.sort do |a, b|
#   a[:published] <=> b[:published]
# end

# p sorted_books
# we want to increment every number by 1 without changing the data structure.

# [[[1, 2], [3, 4]], [5, 6]].map do |arr|
#   arr.map do |ele|
#     if ele.to_s.size == 1 # It is an Integer
#       ele += 1
#     else
#       ele.map do |el|
#         el += 1
#       end
#     end
#   end
# end

# For example, take the 2-element array below,
# where we only want to select integers greater than 13 but strings less than 6 characters.

# [[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |array|
#   array.select do |ele|
#     if ele.to_s.to_i == ele
#       ele > 13
#     else
#       ele.length < 6
#     end
#   end
# end

# arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

# arr.sort_by do |sub_arr|
#   sub_arr.map do |num|
#     num.to_i
#   end
# end

