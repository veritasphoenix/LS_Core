require 'pry'
require 'yaml'
MESSAGE = YAML.load_file('rps_prompts.yml')
VALID_CHOICE = %w(rock paper scissors lizard spock)

# Keys are the choice and the values are what it beats
GAME_LOGIC = {
  rock: ['lizard', 'scissors'],
  paper: ['spock', 'rock'],
  scissors: ['paper', 'lizard'],
  lizard: ['spock', 'paper'],
  spock: ['rock', 'scissors']
}

POINTS_TO_WIN = 5

# I didn't write this class
class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end

def clear_screen
  system('clear') || system('cls')
end

def prompt(input)
  "=> #{MESSAGE[input]}"
end

# Convert player_choice from number to choice name
def convert_choice_to_string(player_choice)
  case player_choice
  when '1' then player_choice = 'rock'
  when '2' then player_choice = 'paper'
  when '3' then player_choice = 'scissors'
  when '4' then player_choice = 'lizard'
  when '5' then player_choice = 'spock'
  end

  player_choice
end

def display_player_choices
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

# Get the users numerical choice
def get_player_choice
  choice = ''

  loop do
    puts display_player_choices
    choice = gets.chomp.strip
    choice = convert_choice_to_string(choice)

    break if VALID_CHOICE.include?(choice)

    puts prompt('invalid_choice').red
    puts
  end

  choice
end

def print_ready
  puts '   ______    _______  _______  ______   __   __ '.red
  puts '  |    _ |  |       ||   _   ||      | |  | |  |'.red
  puts '  |   | ||  |    ___||  |_|  ||  _    ||  |_|  |'.red
  puts '  |   |_||_ |   |___ |       || | |   ||       |'.red
  puts '  |    __  ||    ___||       || |_|   ||_     _|'.red
  puts '  |   |  | ||   |___ |   _   ||       |  |   |  '.red
  puts '  |___|  |_||_______||__| |__||______|   |___|  '.red
end

def print_one
  puts ' _______  __    _  _______ '.yellow
  puts '|       ||  |  | ||       |'.yellow
  puts '|   _   ||   |_| ||    ___|'.yellow
  puts '|  | |  ||       ||   |___ '.yellow
  puts '|  |_|  ||  _    ||    ___|'.yellow
  puts '|       || | |   ||   |___ '.yellow
  puts '|_______||_|  |__||_______|'.yellow
end

def print_two
  puts ' _______  _     _  _______ '.yellow
  puts '|       || | _ | ||       |'.yellow
  puts '|_     _|| || || ||   _   |'.yellow
  puts '  |   |  |       ||  | |  |'.yellow
  puts '  |   |  |       ||  |_|  |'.yellow
  puts '  |   |  |   _   ||       |'.yellow
  puts '  |___|  |__| |__||_______|'.yellow
end

def print_three
  puts ' _______  __   __  ______    _______  _______ '.yellow
  puts '|       ||  | |  ||    _ |  |       ||       |'.yellow
  puts '|_     _||  |_|  ||   | ||  |    ___||    ___|'.yellow
  puts '  |   |  |       ||   |_||_ |   |___ |   |___ '.yellow
  puts '  |   |  |       ||    __  ||    ___||    ___|'.yellow
  puts '  |   |  |   _   ||   |  | ||   |___ |   |___ '.yellow
  puts '  |___|  |__| |__||___|  |_||_______||_______|'.yellow
end

def print_go
  puts ' _______  _______  __ '.green
  puts '|       ||       ||  |'.green
  puts '|    ___||   _   ||  |'.green
  puts '|   | __ |  | |  ||  |'.green
  puts '|   ||  ||  |_|  ||__|'.green
  puts '|   |_| ||       | __ '.green
  puts '|_______||_______||__|'.green
end

def lead_up
  clear_screen
  print_ready
  system("sleep 1")
  clear_screen
  print_one
  system("sleep 0.5")
  clear_screen
  print_two
  system("sleep 0.5")
  clear_screen
  print_three
  system("sleep 0.5")
  clear_screen
  print_go
  system("sleep 1")
  clear_screen
end

def print_round_choices(player, computer)
  puts "=> You chose: #{player.light_blue} and the almighty overlord chose: #{computer.red}"
  puts
end

def round_winner(player_choice, computer_choice)
  winner = ''

  if GAME_LOGIC[player_choice.to_sym].include? computer_choice
    winner = 'player'
  elsif GAME_LOGIC[computer_choice.to_sym].include? player_choice
    winner = 'computer'
  end

  winner
end

def print_round_winner(round_winner, round_number)
  case round_winner
  when 'player'
    puts format(prompt('player_wins'), round: round_number)
    puts
  when 'computer'
    puts format(prompt('computer_wins'), round: round_number)
    puts
  else
    puts format(prompt('tie'), round: round_number)
  end
end

def update_score(score_hash, round_winner)
  case round_winner
  when 'player'
    score_hash[:player] += 1
  when 'computer'
    score_hash[:computer] += 1
  end
  score_hash 
end

def display_score(score_hash)
  puts prompt 'current_score'
  puts "Player: #{score_hash[:player]}   Computer: #{score_hash[:computer]}"
  puts
end

def update_round(round)
  round += 1
  round
end

def grand_winner(winner)
  puts prompt('player_grand_winner').light_blue if winner == :player
  puts prompt('computer_grand_winner').red if winner == :computer
end

def play_again?
  response = ''

  loop do
    puts prompt('play_again').green
    response = gets.chomp.downcase.strip

    case response
    when 'y'
      break response = true
    when 'n'
      break response = false
    else
      puts prompt('invalid_input').red
    end
  end

  response
end

# Main loop
loop do
  clear_screen

  score_hash = { player: 0, computer: 0 }
  round = 1
  puts prompt('welcome').green

  loop do
    player = get_player_choice
    computer = VALID_CHOICE.sample

    lead_up

    print_round_choices(player, computer)

    current_round_winner = round_winner(player, computer)

    print_round_winner(current_round_winner, round)

    score_hash = update_score(score_hash, current_round_winner)
    
    display_score(score_hash)

    round = update_round(round)

    break if score_hash[:player] == POINTS_TO_WIN ||
             score_hash[:computer] == POINTS_TO_WIN
  end

  grand_winner = score_hash.key(POINTS_TO_WIN)
  grand_winner(grand_winner)
  
  break unless play_again?
end

clear_screen
puts prompt('thanks').green
