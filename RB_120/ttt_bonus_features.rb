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

  def []=(num, marker)
    squares[num].marker = marker
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
      squares = @squares.values_at *line
      if three_identical_markers? squares
        return squares.first.marker
      end
    end
    nil
  end

  def find_at_risk_square(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at *line
      marked = squares.select(&:marked?).collect(&:marker)
      if marked.size == 2 && marked.count(marker == 2)
        risk_square = squares.select(&:unmarked?).first
        return @squares.key(risk_square)
      end
    end
    nil
  end

  def at_risk_square?(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at *line
      marked = squares.select(&:marked?).collect(&:marker)
      if marked.size == 2 && marked.count(marker) == 2
        return true
      end
    end
    false
  end

  def square_five_empty?
    unmarked_keys.include? 5
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

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
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
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :human, :computer
  attr_accessor :board

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = nil
    @winner = nil
    @quit = nil
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  # method order: gameplay -> display -> utility

  def computer_moves
    square = if board.at_risk_square?(COMPUTER_MARKER)
               board.find_at_risk_square(COMPUTER_MARKER)
             elsif board.at_risk_square?(HUMAN_MARKER)
               board.find_at_risk_square(HUMAN_MARKER)
             elsif board.square_five_empty?
               5
             else
               board.unmarked_keys.sample
             end

    board[square] = computer.marker
  end

  def continue_or_quit
    puts "Press <Enter> to continue or <q> to quit"
    answer = gets.chomp.downcase
    return @quit = true if answer =~ /\S/
  end

  def convert_first_to_move(answer)
    @current_marker = case answer
                      when '1' then HUMAN_MARKER
                      when '2' then COMPUTER_MARKER
                      else %w(HUMAN_MARKER COMPUTER_MARKER).sample
                      end
    clear
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def first_to_move
    loop do
      puts display_first_to_move
      answer = gets.chomp
      if %w(1 2 3).include? answer
        break if convert_first_to_move(answer)
      else
        puts "Invalid entry, please enter either 1, 2, or 3"
        sleep(2)
      end
    end
  end

  def grand_winner?
    return true if @quit
    Score.total.values.include? 5
  end

  def human_moves
    puts "Choose an available square (#{joiner(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include? square
      puts "Sorry, that's not a valid choice - please choose again."
    end
    board[square] = human.marker
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def main_game
    loop do
      first_to_move
      loop do
        single_game
        break if grand_winner?
      end
      break unless play_again?
      reset_all
      display_play_again_message
    end
  end

  def play_again?
    return false if @quit
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, you must enter either 'y' or 'n'"
    end

    answer == 'y'
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def record_score
    case board.winning_marker
    when HUMAN_MARKER then Score.add_point(:human)
    when COMPUTER_MARKER then Score.add_point(:computer)
    end
  end

  def single_game
    reset
    display_board
    player_move
    record_score
    display_result
    continue_or_quit
  end

  def winner_to_string
    case board.winning_marker
    when HUMAN_MARKER then @winner = 'You are'
    when COMPUTER_MARKER then @winner = 'The Computer is'
    end
  end

  # ----------display methods - in alphabetical order---------- #
  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "You're an #{human.marker}. Computer is an #{computer.marker}."
    puts "The score is: You: #{Score.get(:human)} " \
                  "Computer: #{Score.get(:computer)}"
    board.draw
  end

  def display_first_to_move
    <<-MSG
      Please choose who goes first (Please choose 1, 2, or 3):
      1. Player
      2. Computer
      3. Let the computer choose
    MSG
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye."
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def display_result
    clear_screen_and_display_board

    return puts "#{winner_to_string} the grand winner!" if grand_winner?
    case board.winning_marker
    when human.marker then puts "You won!"
    when computer.marker then puts "The computer won!"
    else puts "It's a tie!"
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ''
    puts "The object of the game is to get 3 'X's in a row, in any direction."
    puts "You also have to keep the computer from getting 3 'O's in a row."
    puts ''
    puts "The first player to win 5 games is the Grand Winner."
    puts "If you are the Grand Winner, you will win...nothing."
    puts "Good Luck!"
    puts ''
    continue_or_quit
  end

  # ----------utility methods - in alphabetical order---------- #
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
    @current_marker = HUMAN_MARKER
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
