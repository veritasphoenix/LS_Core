require 'yaml'
PROMPT_FILE = YAML.load_file('prompts.yml')

def integer?(number)
  Integer(number) rescue false
end

def float?(number)
  Float(number) rescue false
end

def valid_number_entry?(entry)
  entry.to_f > 0 && !entry.empty? &&
  (integer?(entry) || float?(entry))
end

def prompt(key)
  prompt = PROMPT_FILE[$lang][key]
  "=> #{prompt}"
end

def clear_screen
  system 'clear'
end
clear_screen

puts "=> #{PROMPT_FILE['welcome']}"

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

loop do
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

  def get_interest_rate
    interest_rate = ''

    loop do
      puts prompt 'enter_interest_rate'
      interest_rate = gets.chomp.strip
      if valid_number_entry? interest_rate
        interest_rate = interest_rate.to_f
        break
      else
        puts prompt 'invalid_number'
      end
    end

    loop do
      puts prompt 'enter_interest_rate_timing'
      interest_rate_timing = gets.chomp.downcase
      if ['y', 'a', 'm'].include?(interest_rate_timing)
        if interest_rate_timing.start_with?('m')
          interest_rate = (interest_rate / 100) / 12
        end
        break
      else
        puts prompt 'invalid_input'
      end
    end
    interest_rate
  end
  interest_rate = get_interest_rate

  def get_loan_duration
    loan_duration = ''

    loop do
      puts prompt 'enter_loan_duration'
      loan_duration = gets.chomp.strip
      if valid_number_entry? loan_duration
        loan_duration = loan_duration.to_i
        break
      else
        puts prompt 'invalid_number'
      end
    end

    loop do
      puts prompt 'enter_loan_duration_timing'
      loan_duration_timing = gets.chomp.downcase.strip
      if ['m', 'y', 'a'].include?(loan_duration_timing)
        if ['y', 'a'].include?(loan_duration_timing)
          loan_duration *= 12
        end
        break
      else
        puts prompt 'invalid_input'
      end
    end
    loan_duration
  end
  loan_duration = get_loan_duration

  def get_monthly_payment(amount, rate, duration)
    monthly_payment =
    amount * (rate / (1 - (1 + rate)**(-duration)))
  end

  monthly_payment =
  get_monthly_payment(loan_amount, interest_rate, loan_duration).round(2)

  puts "#{prompt('monthly_payment_amount')} $#{monthly_payment}"

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

def goodbye(user_name)
  puts "Thank you, #{user_name}, for using the Mortgage Calculator!"
  puts "Good bye!"
end
goodbye users_name

clear_screen
