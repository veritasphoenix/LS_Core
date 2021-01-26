# 1. Input integer is assigned to a variable num
# 2. use an inclusive range --> (1..num)
# 3. use each method to increment through range
# 4. within each, use += method to perform summation
# 5. save results of each iteration into an output variable
# 6. print output variable to screen

total = 0
(1..8).each do |num|
  total += num
end

puts total