module ClearScreen
  def clear_screen
    system('clear') || system('cls')
  end
end

class Move
  # attr_reader :value
  
  GAME_LOGIC = {
    rock: ['lizard', 'scissors'],
    paper: ['spock', 'rock'],
    scissors: ['paper', 'lizard'],
    lizard: ['spock', 'paper'],
    spock: ['rock', 'scissors']
  }
  
  VALUES = GAME_LOGIC.keys.map(&:to_s)

  # def initialize(value)
  #   @value = value
  # end
  
  # def >(other_move)
  #   GAME_LOGIC[@value.to_sym].include? other_move.value
  # end

  def >(other_move)
    value.include? other_move.value
  end

  def <(other_move)
    GAME_LOGIC[other_move.value.to_sym].include? @value
  end

  def to_s
    @value
  end
end

class Rock < Move
  attr_reader :value

  @value = ['lizard', 'scissors']

  def value
    @value
  end
end

class Player
  include ClearScreen

  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
   def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a name."
    end
    self.name = n
  end

  def convert_choice_to_string(player_choice)
    case player_choice
    when '1' then player_choice = Rock.new
    when '2' then player_choice = 'paper'
    when '3' then player_choice = 'scissors'
    when '4' then player_choice = 'lizard'
    when '5' then player_choice = 'spock'
    end
  
    player_choice
  end

  def display_player_choices
    puts
    player_prompt = <<-MSG
        Please make a choice (1-5):
        1) Rock
        2) Paper
        3) Scissors
        4) Lizard
        5) Spock
        MSG
  
    player_prompt
  end

  def choose
    choice = nil
  
    loop do
      clear_screen
      puts display_player_choices
      choice = gets.chomp.strip
      choice = convert_choice_to_string(choice)
  
      break if Move::VALUES.include? choice
  
      puts "Sorry, invalid choice."
      puts
    end
  
    self.move = choice.value
  end
end

#   def choose
#     choice = nil
  
#     loop do
#       clear_screen
#       puts display_player_choices
#       choice = gets.chomp.strip
#       choice = convert_choice_to_string(choice)
  
#       break if Move::VALUES.include? choice
  
#       puts "Sorry, invalid choice."
#       puts
#     end
  
#     self.move = Move.new(choice)
#   end
# end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Engine
class RPSGame
  include ClearScreen

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = {human: 0, computer: 0}
  end

  def display_score
    puts
    puts "The score is:"
    puts "#{human.name}: #{@score[:human]}"
    puts "#{computer.name}: #{@score[:computer]}"
    puts
  end

  def display_welcome_message
    clear_screen
    puts "Welcome #{human.name} to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks, #{human.name} for playing " \
    "Rock, Paper, Scissors, lizard, spock. Goodbye!"
  end

  def display_moves
    clear_screen
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    puts
  end

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

  def display_round_winner(winner)
    if winner
      puts "#{winner} won this round!"
    else
      puts "It's a tie!"
    end
  end

  def grand_winner?
    @score.values.include? 2
  end

  def display_grand_winner
    grand_winner = @score.key(2)
    if grand_winner == :human
      puts "#{human.name} is the grand winner!"
    else
      puts "#{computer.name} is the grand winner!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "#{human.name}, Would you like to play again? (y/n)"
      answer = gets.chomp
      break if %w(y n).include? answer.downcase
      puts "Sorry, answer must be 'y' or 'n'."
    end

    return true if answer.downcase == 'y'
    return false if answer.downcase == 'n'
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        determine_round_winner
        display_score unless grand_winner?
        sleep(3)
        break if grand_winner?
      end
      display_grand_winner
      display_score
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
