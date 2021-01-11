require 'yaml'
PROMPT_FILE = YAML.load_file('prompts.yml')

def integer?(number)
  Integer(number) rescue false
end

def float?(number)
  Float(number) rescue false
end

def prompt(key, lang='en')
  prompt = PROMPT_FILE[lang][key]
  "=> #{prompt}"
end

puts prompt 'welcome'

lang = ''
loop do
  puts prompt 'lang'
  lang = gets.chomp
  if ['1', '2'].include?(lang)
    case lang
    when '1'
      lang = 'en'
    when '2'
      lang = 'es'
    end
    break
  else
    puts prompt 'invalid_input_lang'
  end
end

users_name = ''
loop do
  puts prompt 'enter_users_name', lang
  users_name = gets.chomp
  if users_name.empty?
    puts prompt 'invalid_input'
  else
    puts "#{prompt('hello', lang)} #{users_name}"
    break
  end
end

loop do
  loan_amount = ''
  loop do
    puts prompt 'enter_amount', lang
    loan_amount = gets.chomp
    if float?(loan_amount) && loan_amount.to_f > 0
      loan_amount = loan_amount.to_f
      break
    else
      puts prompt 'invalid_number', lang
    end
  end

  interest_rate = ''
  loop do
    puts prompt 'enter_interest_rate', lang
    interest_rate = gets.chomp
    if float?(interest_rate) && interest_rate.to_f > 0
      # convert whole num percent to decimal
      interest_rate = interest_rate.to_f / 100
      break
    else
      puts prompt 'invalid_number', lang
    end
  end

  loop do
    puts prompt 'enter_interest_rate_timing', lang
    interest_rate_timing = gets.chomp.downcase
    if ['y', 'a', 'm'].include?(interest_rate_timing)
      if interest_rate_timing == 'm'
        interest_rate /= 12
      end
      break
    else
      puts prompt 'invalid_input', lang
    end
  end

  loan_duration = ''
  loop do
    puts prompt 'enter_loan_duration', lang
    loan_duration = gets.chomp
    if integer?(loan_duration) && loan_duration.to_i > 0
      loan_duration = loan_duration.to_i
      break
    else
      puts prompt 'invalid_number'
    end
  end

  loop do
    puts prompt 'enter_loan_duration_timing', lang
    loan_duration_timing = gets.chomp.downcase
    if ['m', 'y', 'a'].include?(loan_duration_timing)
      if loan_duration_timing == 'y' || loan_duration_timing == 'a'
        loan_duration *= 12
      end
      break
    else
      puts prompt 'invalid_input', lang
    end
  end

  monthly_payment =
    loan_amount * (interest_rate / (1 - (1 + interest_rate)**(-loan_duration)))

  puts "#{prompt('monthly_payment_amount', lang)} $" +
       format('%.2f', monthly_payment).to_s

  puts prompt 'another_calculation', lang
  run_again = gets.chomp.downcase
  break unless run_again.start_with?('y') || run_again.start_with?('s')
end

puts "Thank you, #{users_name}, for using the Mortgage Calculator!"
puts "Good bye!"

# loan_calc.rb

# monthly interest rate
# loan duration in months
# monthly payment

# ask the user for the interest rate
# -ask the user if that is yearly or monthly
# - Check if interest rate is a number
# if it is yearly, convert APR to months
# -ask the user for the loan duration
# Check if loan duration is a number
# -ask the user if that is months or years
# -if it is yearly, convert to months
# ask the user for the loan amount
# calculate the monthy payment
# tell the user the monthy payment
# ask the user if s/he wants to do another calculation

# Move all prompts to external .yml file
# import .yml file -
# translate all prompts to spanish
# create a prompt method that takes in prompt and appands '=>' to the beginning

# START

# GET loan_amount - float
# SUBPROCESS check if loan_ampunt is a number
# => GET number from main program
# => IF number, return true
# => IF not, return false

# GET interest_rate APR - float
# SUBPROCESS check IF interest_rate is a number
# => GET number from main program
# => IF number, return true
# => IF not, return false

# GET interst_rate_timing for monthly or yearly interest rate
# SUBPROCESS check if interest_rate_timing is a number
# => GET number from main program
# => IF number, return true
# => IF not, return false
# IF yearly, divide by 12 months

# GET loan_duration - integer
# SUBPROCESS check IF loan_duratin is a number
# => GET number from main program
# => IF number, return true
# => IF not, return false

# GET loan_duration_timing in years or months
# SUBPROCESS check if loan_duration_timing is a number
# => GET number from main program
# => IF number, return true
# => IF not, return false
# => IF yearly, divide loan_duration by 12 months

# monthly_payment = loan_amount * (interest_rate / (1 - (1 + interest_rate)**(-loan_duration)))

# PRINT monthly_payment
# PRINT message asking if they want another calculation
# IF yes, loop back to begining
# IF no, PRINT a thank you and exit program

# END
