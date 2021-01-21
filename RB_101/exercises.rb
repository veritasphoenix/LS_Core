def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

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