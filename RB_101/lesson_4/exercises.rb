def upper_snake(str)
  words = str.split
  current_word = 0

  loop do
    current_word += 1
    break if current_word == words.size

    words[current_word].upcase!
  end

  words.join('_')
end

sentence = 'The sky was blue'
p upper_snake(sentence) # => 'THE_SKY_WAS_BLUE'
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |name, details|
#   p name
#   p details
#   # case details['age']
#   # when 0..17
#   #   details['age_group'] = 'kid'
#   # when 18..64
#   #   details['age_group'] = 'adult'
#   # else
#   #   details['age_group'] = 'senior'
#   # end
# end
# munsters.each_key do |key|
#   if munsters[key]['age'].between?(0, 17)
#     munsters[key]['age_group'] = 'kid'
#   elsif munsters[key]['age'].between?(18, 64)
#     munsters[key]['age_group'] = 'adult'
#   else
#     munsters[key]['age_group'] = 'senior'
#   end
# end

# p munsters

# def titlecase(str)
#   str_arr = str.split.map! { |word| word.capitalize }
#   new_str = str_arr.join(' ')
# end

# words = "the flintstones rock"
# puts titlecase(words)

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# statement = "The Flintstones Rock"
# chars = Hash.new(0)

# statement.chars.each { |char| chars[char] += 1 }
# p chars

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.map { |ele| ele.slice(0, 3) }

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.index { |ele| ele.include?("Be")}

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# minimum = ages.values.min

# puts minimum

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.keep_if { |_, v| v <= 100 }
# p ages

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# # puts ages.values.sum
# p ages.values.inject(:+)

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# hsh = {}

# flintstones.each_with_index do |ele, idx|
#   hsh[ele] = idx
# end

# p hsh

# something = { a: "ant", b: "bear", c: "cat" }.map do |key, value|
#   if value.length > 3
#     value
#   end
# end

# p something

# long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
#   value.length >= 4
# end
# p long.to_h
# p short.to_h
# symbol, string = ['hello', 'goodbye', 'one', :one].partition do |ele|
#   ele.class == Symbol
# end
# p symbol
# p string
# { a: "ant", b: "bear", c: "cat" }.first(2)

# arr = { a: "ant", b: "bear", c: "cat" }.each_with_object([[1, 2]]) do |pair, array|
#   array << pair
# end
# p arr.to_h

# def multiply(nums, amount_to_multiply)
#   multiplied_nums = []

#   nums.each { |num| multiplied_nums << num * amount_to_multiply }

#   multiplied_nums
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p multiply(my_numbers, 10) # [10, 40, 30, 70, 20, 60]
# def double_numbers!(arr)
#   counter = 0

#   loop do
#     break if counter == arr.size
#     arr[counter] *= 2 if counter.odd?
#     counter += 1
#   end

#   arr
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers!(my_numbers)

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def select_fruit(hash)
#   keys = hash.keys
#   fruits = {}

#   keys.each do |key|
#     if hash[key] == 'Fruit'
#       fruits[key] = hash[key]
#     end
#   end

#   fruits
# end

# puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# arr = []
# count = 1
# num = ''

# until count == 6
#   case count
#   when 1
#     puts ">> Please enter the 1st number:"
#   when 2
#     puts ">> Please enter the 2nd number:"
#   when 3
#     puts ">> Please enter the 3rd number:"
#   when 4, 5
#     puts "Please enter the #{count}th number:"
#   end
#   num = gets.chomp.to_i
#   arr << num
#   count += 1
# end

# puts ">> Please enter the last number:"
# num = gets.chomp.to_i

# if arr.include? num
#   puts "The number #{num} is included in the array #{arr}."
# else
#   puts "The num #{num} is not included in the array #{arr}."
# end

# number_of_pets = {
#   'dogs' => 2,
#   'cats' => 4,
#   'fish' => 1
# }

# counter = 0
# pets = number_of_pets.keys

# until counter == number_of_pets.size do
#   type_of_pet = pets[counter]
#   number = number_of_pets[type_of_pet]

#   puts "I have #{number} #{type_of_pet}"
#   counter += 1
# end

# objects = ['hello', :key, 10, []]
# counter = 0

# loop do
#   break if counter == objects.size
#   puts "I am a #{objects[counter].class}!"
#   counter += 1
# end

# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# counter = 0

# loop do
#   break if counter > alphabet.length
#   puts alphabet[counter]
#   counter += 1
# end

# loop do
#   number = rand(1..10)   # a random number between 1 and 10
#   puts 'Hello!'
#   if number == 5
#     puts 'Exiting...'
#     break
#   end
# end

# str = "joe's favorite color is blue"
# str_arr = str.split

# str_arr.each {|ele| ele[0] = ele[0].upcase!}
# new_str = str_arr.join(' ')
# puts new_str
# str = 'How do you get to Carnegie Hall?'
# arr = str.split

# new_str = ''

# arr[0..-2].each do |ele|
#   new_str << ele + ' '
# end
# new_str << arr[-1]

# puts new_str