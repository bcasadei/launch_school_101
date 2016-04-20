# 21_rps_bonus.rb

VALID_CHOICES = %w(r p s l sp).freeze

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
    score_keeper(player)
  elsif win?(computer, player)
    prompt("Computer won!")
    score_keeper(computer)
  else
    prompt("It's a tie!")
  end
end

def score_keeper(point)
  case point
  when 'player'
    p_score += 1
  when 'computer'
    cpu_score += 1
  end
end

def check_winner(score1, score2)
  if score1 == 5
    prompt("You won the match! Do you want to play again? (Y/N)")
    answer = gets.chomp
    reset score
  elsif score2 == 5
    prompt("Computer wins the match! Do you want to play again? (Y/N)")
    answer = gets.chomp
    reset_score
  end
end

def reset_score
  p_score = 0
  cpu_score = 0
end

loop do # main loop
  p_score = 0
  cpu_score = 0
  choice = ''

  loop do
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

    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("Score: You: #{p_score} Computer: #{cpu_score}. Do you want to keep playing? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # end main loop

prompt("Thank you for playing Rock, Paper, Scissors, Lizard, Spock!")
