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

def clear_screen
  system('clear') || system('cls')
end

def prompt(input)
  puts "=> #{MESSAGE[input]}"
end

# Decide who wins
def play(player_choice, computer_choice)
  if GAME_LOGIC[player_choice.to_sym].include? computer_choice
    prompt 'player_wins'
  elsif GAME_LOGIC[computer_choice.to_sym].include? player_choice
    prompt 'computer_wins'
  else
    prompt 'tie'
  end
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

def display_user_choices
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
    puts display_user_choices
    choice = gets.chomp.strip
    choice = convert_choice_to_string(choice)

    break if VALID_CHOICE.include?(choice)

    prompt 'invalid_choice'
    puts ''
  end

  choice
end

def ready
  puts '   ______    _______  _______  ______   __   __ '
  puts '  |    _ |  |       ||   _   ||      | |  | |  |'
  puts '  |   | ||  |    ___||  |_|  ||  _    ||  |_|  |'
  puts '  |   |_||_ |   |___ |       || | |   ||       |'
  puts '  |    __  ||    ___||       || |_|   ||_     _|'
  puts '  |   |  | ||   |___ |   _   ||       |  |   |  '
  puts '  |___|  |_||_______||__| |__||______|   |___|  '
end

def one
  puts ' _______  __    _  _______ '
  puts '|       ||  |  | ||       |'
  puts '|   _   ||   |_| ||    ___|'
  puts '|  | |  ||       ||   |___ '
  puts '|  |_|  ||  _    ||    ___|'
  puts '|       || | |   ||   |___ '
  puts '|_______||_|  |__||_______|'
end

def two
  puts ' _______  _     _  _______ '
  puts '|       || | _ | ||       |'
  puts '|_     _|| || || ||   _   |'
  puts '  |   |  |       ||  | |  |'
  puts '  |   |  |       ||  |_|  |'
  puts '  |   |  |   _   ||       |'
  puts '  |___|  |__| |__||_______|'
end

def three
  puts ' _______  __   __  ______    _______  _______ '
  puts '|       ||  | |  ||    _ |  |       ||       |'
  puts '|_     _||  |_|  ||   | ||  |    ___||    ___|'
  puts '  |   |  |       ||   |_||_ |   |___ |   |___ '
  puts '  |   |  |       ||    __  ||    ___||    ___|'
  puts '  |   |  |   _   ||   |  | ||   |___ |   |___ '
  puts '  |___|  |__| |__||___|  |_||_______||_______|'
end

def go
  puts ' _______  _______  __ '
  puts '|       ||       ||  |'
  puts '|    ___||   _   ||  |'
  puts '|   | __ |  | |  ||  |'
  puts '|   ||  ||  |_|  ||__|'
  puts '|   |_| ||       | __ '
  puts '|_______||_______||__|'
end

def lead_up
  clear_screen
  ready
  system("sleep 1")
  clear_screen
  one
  system("sleep 0.5")
  clear_screen
  two
  system("sleep 0.5")
  clear_screen
  three
  system("sleep 0.5")
  clear_screen
  go
  system("sleep 1")
  clear_screen
end

def play_again?
  response = ''

  loop do
    prompt 'play_again'
    response = gets.chomp.downcase.strip

    if response.start_with? 'y'
      break
    elsif response.start_with? 'n'
      break response = false
    else
      prompt 'invalid_input'
    end
  end

  response
end

# Main loop
loop do
  clear_screen

  prompt 'welcome'

  player = get_player_choice
  computer = VALID_CHOICE.sample

  lead_up

  puts "=> You chose #{player}, " \
       "and your master...er...the computer chose #{computer}."

  play player, computer

  break unless play_again?
end

clear_screen
prompt 'thanks'
