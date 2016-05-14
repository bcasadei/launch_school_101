WINNING_NUMBER = 21
DEALER_STAYS_ON = 17
WINS_FOR_MATCH = 5
SUITS = %w(Clubs Diamonds Hearts Spades).freeze
CARDS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
score = { 'player' => 0, 'dealer' => 0 }

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  CARDS.product(SUITS).shuffle
end

def total(all_cards)
  sum = 0

  all_cards.map do |value, _|
    if value == 'Ace'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  all_cards.select { |value, _| value == 'Ace' }.count.times do
    sum -= 10 if sum > WINNING_NUMBER
  end
  sum
end

def format_cards(cards)
  cards.map { |value, suit| "#{value} of #{suit}" }
end

def initial_deal(player_cards, dealer_cards, deck)
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt("Dealer has: #{format_cards(dealer_cards[0...-1])} and ???")
  prompt("You have: #{format_cards(player_cards)} " \
  "total: #{total(player_cards)}.")
end

def busted?(all_cards)
  total(all_cards) > WINNING_NUMBER
end

def reset_score(score)
  score['player'] = 0
  score['dealer'] = 0
end

def match_winner(score)
  if score['player'] >= WINS_FOR_MATCH
    prompt('You won the match!')
    reset_score(score)
  elsif score['dealer'] >= WINS_FOR_MATCH
    prompt('Dealer won the match!')
    reset_score(score)
  else
    prompt("The first to #{WINS_FOR_MATCH} matches wins")
    prompt("You: #{score['player']}, Dealer: #{score['dealer']}.")
  end
end

def update_score(player_cards, dealer_cards, score)
  result = who_won(player_cards, dealer_cards)

  case result
  when :player_busted, :dealer
    score['dealer'] += 1
  when :dealer_busted, :player
    score['player'] += 1
  end
  match_winner(score)
end

def who_won(player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > WINNING_NUMBER
    :player_busted
  elsif dealer_total > WINNING_NUMBER
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_winner(player_cards, dealer_cards)
  result = who_won(player_cards, dealer_cards)

  case result
  when :player_busted
    prompt('You busted! Dealer wins!')
  when :dealer_busted
    prompt('Dealer busted! You won!')
  when :player
    prompt('You won!')
  when :dealer
    prompt('Dealer wins!')
  when :tie
    prompt("It's a tie!")
  end
end

def show_hand(player_cards, dealer_cards)
  prompt("Dealer has #{format_cards(dealer_cards)}, " \
    "total: #{total(dealer_cards)}")
  prompt("Player has #{format_cards(player_cards)}, " \
    "total: #{total(player_cards)}")
  display_winner(player_cards, dealer_cards)
end

def play_again?
  puts '----------------'
  prompt('Do you want to play again? (y/n)')
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def player_turn(player_cards, deck)
  loop do
    player_turn = nil

    loop do
      prompt('(h)it or (s)tay?')
      player_turn = gets.chomp.downcase

      break if %w(h s).include?(player_turn)
      prompt("Please enter 'h' or 's'.")
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt('You chose to hit!')
      prompt("Your cards: #{format_cards(player_cards)}")
      prompt("Your total: #{total(player_cards)}")
    end
    break if player_turn == 's' || busted?(player_cards)
  end
end

def dealer_turn(dealer_cards, deck)
  prompt('Dealer turn…')

  loop do
    dealer_total = total(dealer_cards)
    break if busted?(dealer_cards) || dealer_total >= DEALER_STAYS_ON

    prompt('Dealer hits!')
    dealer_cards << deck.pop
    prompt("Dealer cards are #{format_cards(dealer_cards)}")
  end
end

loop do
  system 'clear'
  prompt("Welcome to #{WINNING_NUMBER}!")
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  initial_deal(player_cards, dealer_cards, deck)

  player_turn(player_cards, deck)

  if busted?(player_cards)
    show_hand(player_cards, dealer_cards)
    update_score(player_cards, dealer_cards, score)
    play_again? ? next : break
  else
    prompt("You stayed at: #{total(player_cards)}")
  end

  dealer_turn(dealer_cards, deck)

  dealer_total = total(dealer_cards)
  if busted?(dealer_cards)
    prompt("Dealer total: #{dealer_total}")
    show_hand(player_cards, dealer_cards)
    update_score(player_cards, dealer_cards, score)
    play_again? ? next : break
  else
    prompt("Dealer stays at #{dealer_total}")
  end

  show_hand(player_cards, dealer_cards)

  update_score(player_cards, dealer_cards, score)

  break unless play_again?
end
prompt("Thank you for playing #{WINNING_NUMBER}!")
