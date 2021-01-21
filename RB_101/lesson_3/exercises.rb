# v0 = 0
# class SomeClass # Scope gate
#   v1 = 1
#   p local_variables # As the name says, it gives you all local variables in scope

#   def some_method # Scope gate
#     v2 = 2
#     p local_variables
#   end # end of def scope gate
# end # end of class scope gate

# some_class = SomeClass.new
# some_class.some_method
# p local_variables

def mess_with_vars(one, two, three)
  one = "two"
  puts one
  puts one.object_id
  two = "three"
  puts two
  puts two.object_id
  three = "one"
  puts three
  puts three.object_id
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one.object_id}"
puts "two is: #{two.object_id}"
puts "three is: #{three.object_id}"
# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# def mess_with_vars(one, two, three)
#   one.gsub!("one","two")
#   two.gsub!("two","three")
#   three.gsub!("three","one")
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

# def mess_with_vars(one, two, three)
#   puts one.object_id
#   one = two
#   puts one
#   puts one.object_id
#   two = three
#   puts two
#   puts two.object_id
#   three = one
#   puts three
#   puts three.object_id
# end

# one = "one"
# two = "two"
# three = "three"
# puts "one is: #{one.object_id}"
# puts "two is: #{two.object_id}"
# puts "three is: #{three.object_id}"

# mess_with_vars(one, two, three)

# puts "one is: #{one.object_id}"
# puts "two is: #{two.object_id}"
# puts "three is: #{three.object_id}"

# def not_so_tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param += ["rutabaga"]

#   return a_string_param, an_array_param
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]

# my_string, my_array = not_so_tricky_method(my_string, my_array)
# def ascii(str)
#   10.times { puts str.prepend " "}
# end

# input_str = 'The Flintstones Rock!'

# ascii input_str
