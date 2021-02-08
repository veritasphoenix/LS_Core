
COMP_X = 'X'
COMP_O = 'O'

WINNING_LINES = [
 # horizontal wins
 [0, 1, 2],
 [3, 4, 5],
 [6, 7, 8],

 # vertical wins
 [0, 3, 6],
 [1, 4, 7],
 [2, 5, 8],

 # diagonal wins
 [0, 4, 8],
 [2, 4, 6]]

# brd  = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
brd  = ['X', 'X', ' ', 'O', 'O', 'X', 'X', 'O', ' ']
win  = ['0', '1', '2', '3', '4', '5', '6', '7', '8']


moves = []

# # returns an array with all the empty indexes
# brd.each_with_index do |ele, idx|
#   moves << idx if ele == ' '
# end

def move(board, depth)
  p board
  moves = []
  if board.none?(' ')
    return depth
  end


  # returns an array with all the empty indexes
  board.each_with_index do |ele, idx|
    moves << idx if ele == ' '
  end
  
  move = moves.pop
  board[move] = '_'
  depth += 1

  move(board, depth)
end
p move(brd, 0)

def won(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(COMP_X) == 3
      break true
    elsif board.values_at(*line).count(COMP_O) == 3
      break false
    else
      break nil
    end
  end
end

['X', 'X', ' ',
 'O', 'O', 'X',
 'X', 'O', ' ']
 2 +10
 8,2 + 9


['X', 'X', ' ',
 'O', ' ', 'X',
 'X', 'O', ' ']
 2 +10
 4, 2 +9
 4, 8, 2 +8
 8, 2 +9
 8, 4, 2 +8

['X', 'X', 'O',
 'O', ' ', 'X',
 'O', ' ', ' ']
X: 7; O: 4 -10
X: 4; O: 7; X: 8 +0
X: 8; O: 4 -10
X: 4; O: 8; X: 7 +0
X: 4; O: 8; X: 7 +10

[' ', ' ', ' ',
 'O', 'O', 'X',
 'X', 'O', ' ']

