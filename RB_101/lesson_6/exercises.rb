=begin
DEFESIVE AI

input: game board
output: next computer move

rules:
  - if there is only one space left in any of the elements of `WINNING_LINES`, computer takes it

{1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
{1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}

[[1, "X"],
 [2, "X"],
 [3, " "],
 [4, " "],
 [5, " "],
 [6, " "],
 [7, " "],
 [8, " "],
 [9, " "]]

- create a method named computer_defensive_move that takes in the current board
- checks to see if any of the keys with the value `"X"` are about to fill up one of the winning arrays
    - 
- if any of the winning arrays has 2/3 filled, return the index of the containing array & element
- the number of the containing_array[ele] is the key of the computer move

- ```ruby
WINNING_LINES.each
  

```
=end

=begin
GRAND CHAMPION

detects when someone has won 5 games, and declaes the winner

input: tally hash
output: winner string

- takes in the tally hash
- checks if any player has a value of 5
- if a player does, the game stops and the grand champion is declared

- make a loop with the inner loop for individual games
- breaks when there is a grand champion
- make use of the `detect_winner` and `someone_won` methods

grand_winner loop
  game_winner loop
    add 1 to tally
    break when there is a game winner
  end
  break if a player has 5 wins
end

- after win and +1 is added to tally, `detect_grand_champion` is invoked
- iterates over each key
- if a key has a value of 5, return the string of who won
- if no key has 5, return nil

-- `someone_grand_winner?` same as `someone_won?

- break out of outer `grand_champion` loop when `someone_grand_champion?` == true
=end

=begin 
SCORE

  input: winner of the game
  output: boolean if someone won

  explicit:
            - first to win 5 games is the grand champion
            - can't use constants or instance variables
  implicit:

- write a method called `winner` that takes in the winner of the game from `detect_winner()`
- adds 1 to the tally for the winner
  - maybe a hash with the keys `player`, `computer` and the values are the scores
- if tally == 5, proclaim the winner

- there is the detect_winner method that returns `Player` or `Computer`
  - maybe call that from within the tally method
- have the tally method take in the wins_tally hash
  - use `case` statement with the return value
- modify `wins_tally`
- return wins_tally
- have another method that checks if anyone has 5 wins
=end

# def score(wins_tally)
#   case detect_winner(wins_tally)
#   when 'Player' then wins_tally['Player'] += 1
#   when 'Computer' then wins_tally['Computer'] += 1
#   end

#   wins_tally
# end

=begin

JOINER

make this:
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

input: array of ints, and an optional set of separators
output: a formatted atring

rules:
      - if the method is called with no optional arguments:
        - if the input array has 2 elements, the output numbers are separated by `", "` or `"or"`
      - if the method is called with an optional separator as the 2nd argument,
        the numbers are separated by the second argument, not the `", "`
      - if the method is called with the optional 3rd argument:
        - a 2nd argument must also be supplied
        - the 3rd argument changes the word separator

- create a method named joiner
  - required arguement: an array of ints
  - optional arguements: #1 separator symbol #2 word separator
- if the length of the array is 2, return the elements in the output string
- if the array is longer than 2 AND has no optional arguements:
  - first and second elements are separated with comma; second and third are separated with `"or"` --> `"or is the default for the 3rd argument"`
- if the array is longer than 2 AND has 1 optional arguement:
  - change the separator to the one supplied
- if the array is longer than 2 AND has 2 optional arguements:
  - change the separator to the one supplied, and change the last word
- return the string
=end

# def joiner(num_array, delimiter=', ', word='or')
#   case num_array.size
#   when 0 then ''
#   when 1 then num_array.first
#   when 2 then num_array.join(" #{word} ")
#   else
#     num_array[-1] = "#{word} #{num_array.last}"
#     num_array.join(delimiter)
#   end
# end

# puts joiner([1, 2, 3, 4], ', ', 'maybe')