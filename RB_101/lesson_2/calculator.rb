require "yaml"
MESSAGE = YAML.load_file('messages.yml')

def prompt(message)
  puts "=> #{message}"
end

# method to validate integer
def integer?(input)
  Integer(input) rescue false
end

# method to validate float
def float?(input)
  Float(input) rescue false
end

def valid_number?(num) # Validates if input is a valid integer or float
  integer?(num) || float?(num)
end

def operation_to_message(op)
  message = case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  message
end

# ask for the display language
prompt MESSAGE['lang']

lang = ''
loop do # gets the desired language
  lang = gets.chomp.downcase

  if ['en', 'es'].include?(lang)
    break
  else
    prompt MESSAGE['not_valid_message']
  end
end

prompt MESSAGE[lang]["welcome"]

name = ''
loop do # gets users name
  name = gets.chomp

  if name.empty?
    prompt MESSAGE[lang]["not_valid_name"]
  else
    break
  end
end

prompt "#{MESSAGE[lang]['hello']}, #{name}"

loop do # main loop
  number1 = ''
  loop do # get first number
    prompt MESSAGE[lang]["first_number"]
    number1 = gets.chomp

    if valid_number? number1
      break
    else
      prompt MESSAGE[lang]["not_valid_number"]
    end
  end

  number2 = ''
  loop do # get second number
    prompt MESSAGE[lang]["second_number"]
    number2 = gets.chomp

    if valid_number? number2
      break
    else
      prompt MESSAGE[lang]["not_valid_number"]
    end
  end

  # Operation prompts
  if lang == 'en'
    operator_prompt = <<-MSG
      What operation would you like to perform?
      1) Add
      2) Subtract
      3) Multiply
      4) Divide
    MSG
  elsif lang == 'es'
    operator_prompt = <<-MSG
    ¿Qué operación le gustaría realizar?
    1) Añadir
    2) Sustraer
    3) Multiplicar
    4) Dividir
    MSG
  end

  puts operator_prompt

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt MESSAGE[lang]["choose_number"]
    end
  end

  prompt "#{operation_to_message(operator)} #{MESSAGE[lang]['two_numbers']}..."

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  prompt "#{MESSAGE[lang]['result']} #{result}."

  prompt MESSAGE[lang]["another_calculation"]
  answer = gets.chomp
  break unless answer.downcase.start_with?('y' || 's')
end

prompt MESSAGE[lang]["thank_you"]
