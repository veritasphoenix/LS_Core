require 'yaml'
PROMPT_FILE = YAML.load_file('prompts.yml')

# Checks whether number is a valid integer, returns true if it is,
# returns false if it isn't
def integer?(number)
  Integer(number)
rescue ArgumentError
  false
end

# Checks whether number is a valid float, returns true if it is,
# returns false if it isn't
def float?(number)
  Float(number)
rescue ArgumentError
  false
end

# Return true if entry is greater than zero, not empty, and either
# a float or an integer
def valid_number_entry?(entry)
  entry.to_f > 0 && !entry.empty? &&
    (integer?(entry) || float?(entry))
end

# Prepend => to all output.
def prompt(key)
  prompt = PROMPT_FILE[$lang][key]
  "=> #{prompt}"
end

# Clear screen. Used before and after app runs
def clear_screen
  system('clear') || system('cls')
end

# Get users desired display language, and save it
# to the global variable $lang
def get_lang
  loop do
    puts "=> #{PROMPT_FILE['lang']}"
    language = gets.chomp.strip
    if ['1', '2'].include?(language)
      case language
      when '1' then $lang = 'en'
      when '2' then $lang = 'es'
      end
      break
    else
      puts "=> #{PROMPT_FILE['invalid_input_lang']}"
    end
  end
end

# Get the users name for use in various output
def get_users_name
  user_name = ''
  
  loop do
    puts prompt 'enter_users_name'
    user_name = gets.chomp.strip
    if user_name.empty?
      puts prompt 'invalid_input_name'
    else
      puts format(prompt('hello'), name: user_name)
      break
    end
  end

  user_name
end

# Get the amount of the loan
def get_loan_amount
  loan_amount = ''

  loop do
    puts prompt 'enter_amount'
    loan_amount = gets.chomp.strip
    if valid_number_entry? loan_amount
      loan_amount = loan_amount.to_f
      break
    else
      puts prompt 'invalid_number'
    end
  end

  loan_amount
end

# Get the interest rate amount
def get_interest_rate
  interest_rate = ''

  loop do
    puts prompt 'enter_interest_rate'
    interest_rate = gets.chomp.strip
    if valid_number_entry? interest_rate
      break
    else
      puts prompt 'invalid_number'
    end
  end

  interest_rate
end

# Get whether interest rate is monthly or yearly
def get_interest_rate_timing
  timing = ''

  loop do
    puts prompt 'enter_interest_rate_timing'
    timing = gets.chomp.downcase.strip
    if ['y', 'a', 'm'].include?(timing)
      break
    else
      puts prompt 'invalid_input'
    end
  end

  timing
end

# Calculate the final interest rate
def calculate_interest_rate(rate, timing)
  # Convert rate to decimal (ex. 5 to .05)
  rate = rate.to_f / 100
  if timing == 'm'
    rate /= 12
  end

  rate
end

# Get loan duration
def get_loan_duration
  loan_duration = ''

  loop do
    puts prompt 'enter_loan_duration'
    loan_duration = gets.chomp.strip
    if valid_number_entry? loan_duration
      break
    else
      puts prompt 'invalid_number'
    end
  end

  loan_duration
end

# Get whether loan duration is in months or years
def get_loan_duration_timing
  timing = ''

  loop do
    puts prompt 'enter_loan_duration_timing'
    timing = gets.chomp.downcase.strip
    if %w(y m a).include?(timing)
      break
    else
      puts prompt 'invalid_input'
    end
  end

  timing
end

# Calculate final loan duration (in months)
def calculate_loan_duration(duration, timing)
  if timing.start_with? 'y', 'a'
    duration = duration.to_i * 12
  end

  duration
end

# Uses loan_amount, interest_rate, and loan_duration to calculate
# monthly payment
def calculate_monthly_payment(amount, rate, duration)
  amount * (rate / (1 - (1 + rate)**(-duration)))
end

# Asks user if they would like to make another calculation.
# if yes, the app loops back to beginning of logic loop.
# If no, breaks out of loop
def run_again?
  loop do
    puts prompt 'another_calculation'
    run_again = gets.chomp.downcase.strip

    case run_again
    when 'y', 's' then break true
    when 'n' then break false
    else prompt 'invalid_input'
    end
  end
end

# Thanks the user and says goodbye
def goodbye(user_name)
  puts format(prompt('thank_you'), name: user_name)
  puts prompt 'goodbye'
end

# PROMPT_FILE is referenced directly prior to determining desired output
# language
puts "=> #{PROMPT_FILE['welcome']}"

get_lang

users_name = get_users_name

# Main logic loop
loop do
  clear_screen

  loan_amount = get_loan_amount

  interest_rate = calculate_interest_rate(get_interest_rate, get_interest_rate_timing)

  loan_duration = calculate_loan_duration(get_loan_duration, get_loan_duration_timing)

  monthly_payment =
    calculate_monthly_payment(loan_amount, interest_rate,
                              loan_duration).round(2)
  
  puts format(prompt('monthly_payment_amount'), amount: monthly_payment)

  break unless run_again?
end

clear_screen
goodbye users_name
