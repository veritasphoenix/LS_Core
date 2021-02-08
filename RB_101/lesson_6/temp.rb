# # You have to create a function that takes a positive integer number and returns the next bigger number formed by the same digits:
# #
# # 12 ==> 21
# # 513 ==> 531
# # 2017 ==> 2071
# #
# # If no bigger number can be composed using those digits, return -1:
# #
# # 9 ==> -1
# # 111 ==> -1
# # 531 ==> -1

# =begin
#   input: integer
#   output: integer

#   explicit:
#   implicit:
# =end

# p next_bigger(12) == 21
# p next_bigger(513) == 531
# p next_bigger(2017) == 2071
# p next_bigger(414) == 441
# p next_bigger(144) == 414
# p next_bigger(9) == -1
# p next_bigger(111) == -1
# p next_bigger(531) == -1

require 'pry'
require 'pry-byebug'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[3, 5, 7], [1, 5, 9]]

board = {1=>"X", 2=>"X", 3=>" ", 4=>"O", 5=>"O", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
board_arr = [[1, "X"], [2, "X"], [3, " "], [4, " "], [5, " "], [6, " "], [7, " "], [8, " "], [9, " "]]
new_wl = [["X", " ", " "], ["O", "X", " "], [" ", " ", " "],
          ["X", "O", " "], ["X", "X", " "], ["O", " ", " "],
          [" ", "X", " "], ["X", "X", " "]]

def add(n)
  if n == 1
    return n
  end

  n + add(n - 1)
end

puts add(10)
=begin
- 
=end
# def find_at_risk_square(line, board, marker)
#   if board.values_at(*line).count(marker) == 2
#     board.select {|k,v| line.include?(k) && v == ' '}.keys.first
#   else
#     nil
#   end
# end

# markers = ["O", "X"]
# markers.cycle(1) do |marker|
#   WINNING_LINES.each do |line|
#     p find_at_risk_square(line, board, marker)
#   end
# end


# puts find_at_risk_square(WINNING_LINES[0], board)
# for each sub array, I want to see if any two of the key numbers contain an "X" from the hash
# if two values have an "X", find the value that contains " "
# change the value to "O"

# wl.each do |line|
#   line.each do |space|
#     x = 0
#     space = 0

#   end
# end
=begin
[1, 2, 3] NO
[4, 5, 6] NO
[7, 8, 9] NO
[1, 4, 7] NO
[2, 5, 8] YES 8
=end
# def no_o?(line_array)
#   line_array.index("O") == nil
# end

# def one_empty?(line_array)
#   line_array.count(" ") == 1
# end

# # creates a new board populated with "X" and "O"
# played = WINNING_LINES.map do |line|
#   line.map do |space|
#     board[space]
#   end
# end

# def played_location_to_hash_key(line_array, line_array_idx)
#   ele_idx = line_array.index(" ")
  
#   space_number = WINNING_LINES[line_array_idx][ele_idx]
# end

# # puts played_location_to_hash_key(new_wl[4], 4)

# def ai_defense_move(played_brd)
#   spot_key = nil
#   played_brd.each_with_index do |sub_array, idx|
#     if no_o?(sub_array) && one_empty?(sub_array)
#       spot_key = played_location_to_hash_key(sub_array, idx)
#       break
#     end
#   end
#   spot_key
# end

# puts ai_defense_move(new_wl)
# p board
# p empty_spaces
# first_empty = empty_spaces.find { |arr| arr.size == 1 }
# p first_empty
# first_empty_value = first_empty[0]
# board[first_empty_value] = "O"
# p board

# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

