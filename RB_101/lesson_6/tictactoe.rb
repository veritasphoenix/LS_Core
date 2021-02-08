INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[3, 5, 7], [1, 5, 9]]              # diagonals

def system_clear
  system('cls') || system('clear')
end

def prompt(msg)
  puts ">> #{msg}"
end

def first_player_choices
  system_clear
  <<-MSG
    Please choose who goes first (1-3):
      1) Player
      2) Computer
      3) Random Choice
    MSG
end

def first_player
  choices = { '1' => "Player", '2' => "Computer", '3' => "Choose" }

  loop do
    puts first_player_choices
    choice = gets.chomp

    if ['1', '2', '3'].include?(choice)
      ['Player', 'Computer'].sample if choice == '3'
      break choices[choice]
    else
      prompt 'Invalid choice. Please choose either 1, 2, or 3.'
    end
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, tally)
  system_clear
  prompt "You're the #{PLAYER_MARKER}. Computer is the #{COMPUTER_MARKER}."
  prompt "First to win 5 games is is crowned the Grand Champion"
  prompt "The score is Player:#{tally['Player']}  Computer:#{tally['Computer']}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_wins_tally
  { 'Player' => 0, 'Computer' => 0 }
end

def initialize_board
  new_board = {}
  (1..9).each { |space| new_board[space] = INITIAL_MARKER }
  new_board
end

def joiner(num_array, delimiter=', ', word='or')
  case num_array.size
  when 0 then ''
  when 1 then num_array.first
  when 2 then num_array.join(" #{word} ")
  else
    num_array[-1] = "#{word} #{num_array.last}"
    num_array.join(delimiter)
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == ' ' }.keys.first
  end
end

def place_piece!(brd, current_player)
  if current_player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Please choose a space to place your 'X':" \
           "(#{joiner(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
def computer_places_piece!(brd)
  square = nil

  # offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # pick square 5, if available
  if !square && brd[5] == ' '
    square = 5
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

def alternate_player(current_player)
  case current_player
  when 'Player' then current_player = 'Computer'
  when 'Computer' then current_player = 'Player'
  end

  current_player
end

def score!(board, tally)
  case detect_winner(board)
  when 'Player' then tally['Player'] += 1
  when 'Computer' then tally['Computer'] += 1
  end
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def someone_grand_champion?(tally)
  !!detect_grand_champion(tally)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def detect_grand_champion(tally)
  if tally['Player'] == 5
    return 'Player'
  elsif tally['Computer'] == 5
    return 'Computer'
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def play_again?
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase

    return true if ['y', 'yes'].include?(answer)
    prompt 'Invalid input. Please enter either "y" or "n".'
  end
  false
end

# ------------------- Gameplay ----------------------- #

loop do
  system_clear
  wins_tally = initialize_wins_tally

  loop do
    board = initialize_board
    current_player = first_player

    loop do
      display_board(board, wins_tally)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    score!(board, wins_tally)
    display_board(board, wins_tally)

    if someone_grand_champion?(wins_tally)
      prompt "#{detect_grand_champion(wins_tally)} is the Grand Champion!"
    elsif someone_won?(board)
      prompt "#{detect_winner(board)} won this round!"
    else
      prompt "It's a tie!"
    end
    sleep(2)

    break if someone_grand_champion?(wins_tally)
  end
  break unless play_again?
end

prompt "Thanks for playing tic tac toe"
