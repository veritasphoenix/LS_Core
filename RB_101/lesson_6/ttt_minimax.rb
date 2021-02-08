=begin
rules:

- first round: X = 1
- second round: X = 2
- third round: X = 3
- ...

- win: 1
  loss: -1
  tie: 0

- need something with all the winning moves

- create a new, empty board
- create a score

=end

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

dep = 0

def move(board)
  WINNING_LINES.each
end

def win?(board)

end



