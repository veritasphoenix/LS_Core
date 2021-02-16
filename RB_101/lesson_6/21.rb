NAMES = { 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace' }
SUITS = { 'H' => 'Hearts', 'D' => 'Diamonds', 'C' => 'Clubs', 'S' => 'Spades' }
FACE_CARD_VALUES = { 'J' => 10, 'Q' => 10, 'K' => 10 }
DEALER_MINIMUM = 17

def system_clear
  system('cls') || system('clear')
end

def create_deck
  new_deck = []

  ['H', 'D', 'C', 'S'].each do |suit|
    [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].each do |value|
      new_deck << [value, suit]
    end
  end

  new_deck
end

def deal_card(deck)
  card = deck.sample
  delete_card!(deck, card)
end

def deal_first_2_cards(deck)
  cards = []
  2.times do
    cards << deal_card(deck)
  end
  cards
end

def delete_card!(deck, card)
  deck.delete(card)
end

def card_values(hand)
  hand.map(&:first)
end

def convert_letters_to_name(hand)
  hand.map do |card|
    if NAMES.keys.include?(card)
      NAMES[card]
    else
      card
    end
  end
end

def display_player_cards(player_hand)
  player_hand = convert_letters_to_name(player_hand)
  if player_hand.size == 2
    puts "You have: #{player_hand.first} and #{player_hand.last}"
  else
    puts "You have: #{player_hand[0..-2].join(', ')} and #{player_hand.last}"
  end
end

def display_one_dealer_card(dealer_hand)
  first_card = convert_letters_to_name(dealer_hand).first
  puts "Dealer has: #{first_card} and unknown card"
end

def display_all_dealer_cards(dealer_hand)
  dealer_hand = convert_letters_to_name(dealer_hand)
  if dealer_hand.size == 2
    puts "Dealer has: #{dealer_hand.first} and #{dealer_hand.last}"
  else
    puts "Dealer has: #{dealer_hand[0..-2].join(', ')} and #{dealer_hand.last}"
  end
end

def display_player_draw_result(player_card_values)
  puts "You drew a #{player_card_values.last}."
  puts
  display_player_cards(player_card_values)
end

def display_hands(player_hand, dealer_hand)
  display_player_cards(player_hand)
  display_one_dealer_card(dealer_hand)
end

def display_final_hands(player_hand, dealer_hand)
  puts "The final hands:"
  display_player_cards(player_hand)
  puts "Player total: #{calculate_hand_value(player_hand)}"
  puts "----------------"
  display_all_dealer_cards(dealer_hand)
  puts "Dealer total: #{calculate_hand_value(dealer_hand)}"
  puts "----------------"
end

def calculate_hand_value(hand)
  hand_value = hand.map do |card|
    if FACE_CARD_VALUES.has_key?(card)
      FACE_CARD_VALUES[card]
    else
      card
    end
  end

  hand_value.each_with_index do |card, idx|
    if card == 'A'
      hand_value[idx] = calculate_ace_value(hand_value)
    end
  end
  hand_value.sum
end

def calculate_ace_value(hand)
  total = hand.select { |card| card.to_s.to_i == card }.sum
  if total + 11 <= 21
    11
  else
    1
  end
end

def dealer_stay?(hand_total)
  hand_total >= DEALER_MINIMUM
end

def twenty_one?(total)
  total == 21
end

def busted?(hand_total)
  hand_total > 21
end

def determine_winner(player_total, dealer_total)
  if (player_total > dealer_total || dealer_total > 21) && player_total <= 21
    'player'
  elsif (dealer_total > player_total || player_total > 21) && dealer_total <= 21
    'dealer'
  elsif player_total == dealer_total
    'tie'
  end
end

def display_winner(winner)
  case winner
  when 'tie' then puts "It's a tie!"
  when 'player' then puts "You win!"
  when 'dealer' then puts "Dealer is the winner!"
  end
end

def play_again?
  loop do
    puts "Would you like to play again, yes or no? Please enter 'y' or 'n'"
    answer = gets.chomp.downcase
    case answer
    when 'y', 'yes' then break true
    when 'n', 'no' then break false
    else puts "Invalid input. Please enter either 'y' or 'n'"
    end
  end
end

# ----------------------------- MAIN LOOP ---------------------------------

system_clear
puts 'Welcome to 21'
puts 'You will go first. Try to get as close to 21 without going over.'
puts 'Good Luck.'
sleep(3)

loop do
  system_clear
  puts "Shuffling..."
  sleep(2)
  system_clear
  
  game_deck = create_deck
  player_card_values = card_values(deal_first_2_cards(game_deck))
  dealer_card_values = card_values(deal_first_2_cards(game_deck))
  # if you want the card suits too, deal into separate deck variable,
  # then get values
  player_total = calculate_hand_value(player_card_values)
  dealer_total = calculate_hand_value(dealer_card_values)
  display_hands(player_card_values, dealer_card_values)

  # game loop
  loop do
    if twenty_one?(player_total)
      puts "Player was dealt blackjack! Player wins."
      break
    end

    # player loop
    loop do
        puts "Your hand currently totals #{player_total}."
        puts "Would you like to hit or stay? Please enter an 'h' or 's'"
        response = gets.chomp.downcase
          
        if %w(h hit).include?(response)
          system_clear
          player_card_values << deal_card(game_deck).first
          player_total = calculate_hand_value(player_card_values)

          display_hands(player_card_values, dealer_card_values)

          if busted?(player_total)
            puts "Sorry, your hand totals #{player_total}, you busted!"
            sleep(2)
            break
          end
        elsif %w(s stay).include?(response)
          puts "Player stays. Dealer's turn."
          sleep(2)
          system_clear
          break
        else
          puts "Invalid response."
        end
    end

    break if busted?(player_total)

    # dealer loop
    loop do
      if busted?(dealer_total)
        puts "Dealer has #{dealer_total}. Dealer busted!"
        break
      elsif dealer_stay?(dealer_total)
        puts "Dealer stays at #{dealer_total}."
        break
      else
        dealer_card_values << deal_card(game_deck).first
        dealer_total = calculate_hand_value(dealer_card_values)
      end
    end

    # display results
    system_clear
    display_final_hands(player_card_values, dealer_card_values)
    display_winner(determine_winner(player_total, dealer_total))
    break
  end

  break unless play_again?
end

system_clear
puts "Thank you for playing blackjack!"
