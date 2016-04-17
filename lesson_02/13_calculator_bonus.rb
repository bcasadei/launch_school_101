# ask for 2 numbers
# ask the user for an operation to perform
# perform the operation on the 2 numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_msg(op)
  operation = case op
              when '1'
                'Adding'
              when '2'
                'Subtracting'
              when '3'
                'Multiplying'
              when '4'
                'Dividing'
              end
  operation
end

name = ''
loop do
  prompt(MESSAGES['welcome'])
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_num'])
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_num'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_num'])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_num'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['choose_operator'])
    end
  end

  prompt("#{operation_msg(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}.")

  prompt(MESSAGES['calculate_again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # end main loop

prompt(MESSAGES['thank_you'])
