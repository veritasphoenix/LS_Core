class Board # methods in alphabetical order
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_accessor :squares

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  # ----------methods in order of use---------- #

  def []=(num, marker)
    squares[num].marker = marker
  end

  def at_risk_square?(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      marked = squares.select(&:marked?).collect(&:marker)
      if marked.size == 2 && marked.count(marker) == 2
        return true
      end
    end
    false
  end

  def find_at_risk_square(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      marked = squares.select(&:marked?).collect(&:marker)
      if marked.size == 2 && marked.count(marker) == 2
        risk_square = squares.select(&:unmarked?).first
        return @squares.key(risk_square)
      end
    end
    nil
  end

  def square_five_empty?
    unmarked_keys.include? 5
  end

  def unmarked_keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers? squares
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_accessor :marker, :name

  def initialize
    set_name
    set_marker
  end
end

class Human < Player
  def clear_screen
    system('clear') || system('cls')
  end

  def set_name
    clear_screen
    puts "Hello, what would you like to be called?"
    @name = gets.chomp
  end

  def set_marker
    puts "#{@name}, please choose a marker:"
    self.marker = gets.chomp
  end
end

class Computer < Player
  COMPUTER_MARKER = "O"

  def set_name
    @name = %w(R2D2 Sparky C3PO Hal).sample
  end

  def set_marker
    self.marker = COMPUTER_MARKER
  end
end

class Score
  @@score = { human: 0, computer: 0 }

  def self.add_point(player)
    @@score[player] += 1
  end

  def self.get(player)
    @@score[player]
  end

  def self.total
    @@score
  end

  def self.reset
    @@score = { human: 0, computer: 0 }
  end
end

class TTTGame
  attr_reader :human, :computer, :human_marker, :computer_marker
  attr_accessor :board

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @human_marker = human.marker
    @computer_marker = computer.marker
    @current_marker = @player_pick
    @player_pick = nil
    @winner = nil
    @quit = nil
  end

  def play
    main_game
    display_goodbye_message
  end

  private

  # ----------gameplay methods - in order of execution---------- #
  def main_game
    loop do
      startup_sequence
      loop do
        single_game
        break if grand_winner?
      end
      break unless play_again?
      reset_all
      display_play_again_message
    end
  end

  def single_game
    reset
    display_board
    move_sequence
    record_score
    display_result
    continue_or_quit
  end

  def startup_sequence
    clear
    display_welcome_message
    determine_first_to_move
    clear
  end

  def determine_first_to_move
    loop do
      puts display_first_to_move
      answer = gets.chomp.strip
      break if convert_first_to_move(answer)
      puts "Invalid entry, please enter either 1, 2, or 3"
      sleep(2)
    end
  end

  def convert_first_to_move(answer)
    @player_pick = case answer
                   when '1' then human_marker
                   when '2' then computer_marker
                   when '3' then [computer_marker, human_marker].sample
                   end
  end

  def move_sequence
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def current_player_moves
    human_turn? ? human_moves : computer_moves
    @current_marker = switch_player
  end

  def switch_player
    @current_marker == human_marker ? computer_marker : human_marker
  end

  def human_turn?
    @current_marker == human_marker
  end

  def human_moves
    puts "#{human.name}, please choose an available square: "
    puts "(#{joiner(board.unmarked_keys)})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include? square
      puts "Sorry, that's not a valid choice - please choose again."
    end
    board[square] = @human_marker
  end

  def computer_moves
    square = if board.at_risk_square?(@computer_marker)
               board.find_at_risk_square(@computer_marker)
             elsif board.at_risk_square?(@human_marker)
               board.find_at_risk_square(@human_marker)
             elsif board.square_five_empty?
               5
             else
               board.unmarked_keys.sample
             end

    board[square] = computer_marker
  end

  def winner_to_string
    case board.winning_marker
    when human_marker then @winner = "#{human.name}, you are"
    when computer_marker then @winner = "#{computer.name} is"
    end
  end

  def record_score
    case board.winning_marker
    when human_marker then Score.add_point(:human)
    when computer_marker then Score.add_point(:computer)
    end
  end

  def grand_winner?
    return true if @quit
    Score.total.values.include? 5
  end

  def play_again?
    return false if @quit
    answer = nil
    loop do
      puts "#{human.name}, would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, you must enter either 'y' or 'n'"
    end

    answer == 'y'
  end

  def continue_or_quit
    puts "Press <Enter> to continue or <q> to quit"
    answer = gets.chomp.downcase
    return @quit = true if answer =~ /\S/
  end

  # ----------display methods - in order of execution---------- #

  def display_welcome_message
    puts "Welcome, #{human.name}, to Tic Tac Toe!"
    puts ''
    puts "The object of the game is to get 3 'X's in a row, in any direction."
    puts "You also have to keep the computer from getting 3 'O's in a row."
    puts ''
    puts "The first player to win 5 games is the Grand Winner."
    puts "If you are the Grand Winner, you will win...nothing."
    puts "Good Luck!"
    puts ''
  end

  def display_first_to_move
    <<-MSG
    #{human.name}, one last question. Please choose who goes first:
    (Please choose 1, 2, or 3)

      1. Player
      2. Computer
      3. Let the computer choose
    MSG
  end

  def display_board
    puts "You're a #{human_marker} and #{computer.name} is a #{computer_marker}"
    puts "The score is: You: #{Score.get(:human)}   " \
          "#{computer.name}: #{Score.get(:computer)}"
    board.draw
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result
    clear_screen_and_display_board

    return puts "#{winner_to_string} the grand winner!" if grand_winner?
    case board.winning_marker
    when human_marker then puts "#{human.name}, you won!"
    when computer_marker then puts "#{computer.name} won!"
    else puts "It's a tie!"
    end
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe, #{human.name}! Goodbye."
  end

  # ----------utility methods---------- #

  def clear
    system('clear') || system('cls')
  end

  def joiner(available, separator=', ', end_word='or')
    case available.size
    when 0 then ''
    when 1 then available.first
    when 2 then available.join(" #{end_word} ")
    else
      available[-1] = "#{end_word} #{available.last}"
      available.join(separator)
    end
  end

  def reset
    @current_marker = @player_pick
    board.reset
    @winner = nil
    @quit = nil
    clear
  end

  def reset_all
    @current_marker = nil
    board.reset
    Score.reset
    @winner = nil
    @quit = nil
    clear
  end
end

game = TTTGame.new
game.play
