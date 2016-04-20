# 21_rps_bonus.rb

VALID_CHOICES = %w(r p s l sp).freeze
p_score = 0
cpu_score = 0

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'r' && second == 's') ||
    (first == 'p' && second == 'r') ||
    (first == 's' && second == 'p') ||
    (first == 'l' && second == 'p') ||
    (first == 'sp' && second == 's') ||
    (first == 'r' && second == 'l') ||
    (first == 'p' && second == 'sp') ||
    (first == 's' && second == 'l') ||
    (first == 'l' && second == 'sp') ||
    (first == 'sp' && second == 'r')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

welcome_prompt = <<-MSG
  ----------------------------------
  Welcome to Rock, Paper, Scissors, Spock!
  ----------------------------------------
  Scissors cuts Paper covers Rock crushes
  Lizard poisons Spock smashes Scissors
  decapitates Lizard eats Paper disproves
  Spock vaporizes Rock crushes Scissors.
  ----------------------------------------
  First to five wins the match!
  ----------------------------------------
  MSG
prompt(welcome_prompt)

loop do # main loop
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  if win?(choice, computer_choice)
    p_score += 1
  elsif win?(computer_choice, choice)
    cpu_score += 1
  end

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

  if p_score == 5
    prompt("You won the match! You: #{p_score} Computer: #{cpu_score}.")
    break
  elsif cpu_score == 5
    prompt("The computer won the match! You: #{p_score} Computer: #{cpu_score}.")
    break
  end

  display_results(choice, computer_choice)

  prompt("Score: You: #{p_score} Computer: #{cpu_score}. Do you want to keep playing? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # end main loop

prompt("Thank you for playing Rock, Paper, Scissors, Lizard, Spock")
