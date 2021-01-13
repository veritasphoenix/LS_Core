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
clear_screen

# PROMPT_FILE is referenced directly prior to determining desired output
# language
puts "=> #{PROMPT_FILE['welcome']}"

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
get_lang

# Get the users name for use in various output
def get_users_name
  puts prompt 'enter_users_name'
  user_name = gets.chomp.strip
  if user_name.empty?
    puts prompt 'invalid_input_name'
  else
    puts "#{prompt('hello')} #{user_name}"
  end
  user_name
end
users_name = get_users_name

# Main logic loop
loop do
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
  loan_amount = get_loan_amount

  # Get whether interest rate is monthly or yearly, and if it is monthly,
  # convert it to yearly
  def calculate_monthly_or_yearly_interest_rate(rate)
    calculated_interest_rate = rate

    loop do
      puts prompt 'enter_interest_rate_timing'
      interest_rate_timing = gets.chomp.downcase.strip
      if ['y', 'a', 'm'].include?(interest_rate_timing)
        if interest_rate_timing.start_with?('m')
          calculated_interest_rate = rate / 12
        end
        break
      else
        puts prompt 'invalid_input'
      end
    end
    calculated_interest_rate
  end

  # Get the interest rate. Used by
  def get_interest_rate
    interest_rate = ''

    loop do
      puts prompt 'enter_interest_rate'
      interest_rate = gets.chomp.strip
      if valid_number_entry? interest_rate
        interest_rate =
          calculate_monthly_or_yearly_interest_rate(interest_rate.to_f / 100)
        break
      else
        puts prompt 'invalid_number'
      end
    end
    interest_rate
  end
  interest_rate = get_interest_rate

  # Get whether loan duration is in months or years, and if it is in years,
  # convert it into months
  def calculate_loan_duration(time)
    calculated_loan_duration = time

    loop do
      puts prompt 'enter_loan_duration_timing'
      loan_duration_timing = gets.chomp.downcase.strip
      if ['m', 'y', 'a'].include?(loan_duration_timing)
        if ['y', 'a'].include?(loan_duration_timing)
          calculated_loan_duration = time * 12
        end
        break
      else
        puts prompt 'invalid_input'
      end
    end
    calculated_loan_duration
  end

  # Get loan duration. Used by calculate_loan_duration
  # to determine loan_duration
  def get_loan_duration
    loan_duration = ''

    loop do
      puts prompt 'enter_loan_duration'
      loan_duration = gets.chomp.strip
      if valid_number_entry? loan_duration
        loan_duration = calculate_loan_duration(loan_duration.to_i)
        break
      else
        puts prompt 'invalid_number'
      end
    end
    loan_duration
  end
  loan_duration = get_loan_duration

  # Uses loan_amount, interest_rate, and loan_duration to calculate
  # monthly payment
  def calculate_monthly_payment(amount, rate, duration)
    amount * (rate / (1 - (1 + rate)**(-duration)))
  end

  monthly_payment =
    calculate_monthly_payment(loan_amount, interest_rate,
                              loan_duration).round(2)

  puts "#{prompt('monthly_payment_amount')} $#{monthly_payment}"

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

  break unless run_again?
end

# Thanks the user and says goodbye
def goodbye(user_name)
  puts "Thank you, #{user_name}, for using the Mortgage Calculator!"
  puts "Good bye!"
end
goodbye users_name

clear_screen
