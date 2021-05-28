module DisplayAdditions
  def clear_screen
    system('clear') || system('cls')
  end

  def dashed_line
    puts "---------------------------------------"
  end

  def blank_line
    puts
  end
end

class Move
  VALID_CHOICE = %w(1 2 3 4 5)

  attr_reader :value, :beats

  def >(other_move)
    beats.include? other_move.value
  end

  def <(other_move)
    other_move.beats.include? @value
  end
end

class Rock < Move
  def initialize
    super
    @value = 'rock'
    @beats = ['lizard', 'scissors']
  end
end

class Paper < Move
  def initialize
    super
    @value = 'paper'
    @beats = ['spock', 'rock']
  end
end

class Scissors < Move
  def initialize
    super
    @value = 'scissors'
    @beats = ['paper', 'lizard']
  end
end

class Lizard < Move
  def initialize
    super
    @value = 'lizard'
    @beats = ['spock', 'paper']
  end
end

class Spock < Move
  def initialize
    super
    @value = 'spock'
    @beats = ['rock', 'scissors']
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end

  private

  def convert_choice_to_class(choice)
    case choice
    when '1' then Rock.new
    when '2' then Paper.new
    when '3' then Scissors.new
    when '4' then Lizard.new
    when '5' then Spock.new
    end
  end
end

class Human < Player
  include DisplayAdditions

  def choose
    choice = nil

    loop do
      puts display_player_choices
      choice = gets.chomp.strip
      break if Move::VALID_CHOICE.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = convert_choice_to_class(choice)
    RPSGame.record_move_history(name, move.value)
    blank_line
  end

  def display_player_choices
    clear_screen
    blank_line

    <<-MSG
      Please make a choice (1-5):
      1) Rock
      2) Paper
      3) Scissors
      4) Lizard
      5) Spock
    MSG
  end

  def set_name
    n = ""
    loop do
      clear_screen
      puts "Hello, What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a name."
      sleep(2)
    end
    self.name = n
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def moves
    case name
    when 'R2D2'     then '1'
    when 'Hal'      then ['3', '3', '3', '1'].sample
    when 'Chappie'  then ['1', '1', '1', '3'].sample
    when 'Sonny'    then ['2', '2', '4', '4'].sample
    when 'Number 5' then '5'
    end
  end

  def choose
    choice = moves
    p choice
    self.move = convert_choice_to_class(choice)
    RPSGame.record_move_history(name, move.value)
  end
end

class RPSGame
  include DisplayAdditions

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = { human: 0, computer: 0, round: 1 }
    @@move_history = { human.name => [], computer.name => [] }
  end

  # Methods are arranged alphabetically
  def display_goodbye_message
    clear_screen
    puts "Thanks, #{human.name}, for playing " \
    "Rock, Paper, Scissors, lizard, spock. Goodbye!"
  end

  def display_grand_winner
    blank_line
    grand_winner = @score.key(3)
    if grand_winner == :human
      puts "#{human.name} is the grand winner!"
    else
      puts "#{computer.name} is the grand winner!"
    end
    wait_for_enter
  end

  def display_moves
    clear_screen
    blank_line
    puts "#{human.name} chose #{human.move.value}."
    puts "#{computer.name} chose #{computer.move.value}."
    blank_line
  end

  def display_move_history
    puts "#{human.name}'s move history:"
    @@move_history[human.name].each { |n| puts n }
    puts "#{computer.name}'s move history:"
    @@move_history[computer.name].each { |n| puts n }
    wait_for_enter
  end

  def display_round_winner(winner)
    if winner
      puts "#{winner} won round #{@score[:round]}!"
    else
      puts "It's a tie!"
    end

    @score[:round] += 1
  end

  def display_score
    blank_line
    dashed_line
    puts "#{human.name}: #{@score[:human]}"
    puts "#{computer.name}: #{@score[:computer]}"
    dashed_line
    blank_line
  end

  def display_welcome_message
    clear_screen
    blank_line
    puts "#{human.name}, Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    sleep(3)
  end

  def play
    display_welcome_message
    loop do
      until grand_winner?
        play_round
      end
      display_grand_winner
      @score = { human: 0, computer: 0, round: 1 }
      break unless play_again?
    end
    display_goodbye_message
  end

  def play_again?
    dashed_line
    blank_line
    answer = nil
    loop do
      puts "#{human.name}, Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, answer must be 'y' or 'n'."
    end

    answer == 'y'
  end

  def play_round
    human.choose
    computer.choose
    display_moves
    determine_round_winner
    display_score
    display_move_history
  end

  def self.record_move_history(name, value)
    @@move_history[name] << value
  end

  def wait_for_enter
    blank_line
    puts "When you're ready to continue, press ENTER"
    gets
  end

  private

  def determine_round_winner
    if human.move > computer.move
      @score[:human] += 1
      display_round_winner(human.name)
    elsif human.move < computer.move
      @score[:computer] += 1
      display_round_winner(computer.name)
    else
      display_round_winner(nil)
    end
  end

  def grand_winner?
    @score.values[0..1].include? 3
  end
end

RPSGame.new.play
