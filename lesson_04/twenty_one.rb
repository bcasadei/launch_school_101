=begin
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end
# test_ary = [['2', 'Clubs'], ['3', 'Clubs']]

require 'pry'

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  suits = ['Clubs', 'Diamonds', 'Hearts', 'Spades'] * 13
  cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'] * 4
  # for each suit create a nested array with pairs [suit, card]
  new_deck = cards.zip(suits)
  new_deck
end

def display_hand(hand, player)
  prompt("#{player}: #{hand}") if player == 'Player'
  prompt("#{player}: #{hand[0]} [Face Down Card] #{hand[2..-1]}") if player == 'Dealer'
end

def deal_cards(deck, hand, player)
  hand << deck.sample(2)
  hand.flatten!(1)
  hand.each { |card| deck.delete card }
  display_hand(hand, player)
end

def total_cards(all_cards)
  sum = 0
  all_cards.each do |card| 
    if card[0] == 'Ace' 
      sum += 11 
    elsif card[0].to_i == 0
      sum += 10
    else
      sum += card[0].to_i
    end
  end

  all_cards.select { |card| card[0] == 'Ace' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(all_cards)
  if total_cards(all_cards) > 21
    return true
  else 
    return false
  end
end

def hit(deck, hand, player)
  hand << deck.sample
  hand.each { |card| deck.delete card }
  display_hand(hand, player)
end

def display_winner(winner)
  if winner == 'Player'
    prompt('Congratulations! You won!')
  elsif winner == 'Dealer'
    prompt('Dealer wins!')
  else
    prompt("It's a tie!")
  end
end

def who_won(p_cards, d_cards)
  case
  when busted?(p_cards)
    prompt('You Busted!')
    display_winner('Dealer')
  when busted?(d_cards)
    prompt('Dealer Busted!')
    display_winner('Player')
  when total_cards(p_cards) > total_cards(d_cards)
    display_winner('Player')
  when total_cards(d_cards) > total_cards(p_cards)
    display_winner('Dealer')
  else
    display_winner('Tie')
  end
end

loop do # main game loop
  system 'clear'
  player_cards = []
  dealer_cards = []
  player_one = 'Player'
  dealer = 'Dealer'
  deck = initialize_deck
  deal_cards(deck, player_cards, player_one)
  deal_cards(deck, dealer_cards, dealer)

  loop do
    break if busted?(player_cards)
    prompt('Hit or Stay? (H/S)')
    answer = gets.chomp
    
    break if answer.downcase.start_with?('s')
    hit(deck, player_cards, player_one)
  end

  loop do
    break if busted?(dealer_cards) || busted?(player_cards)
    break if total_cards(dealer_cards) > 17
    hit(deck, dealer_cards, dealer)
  end

  who_won(player_cards, dealer_cards)
  prompt('Would you like to play again? (Y/N)')
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end
prompt('Thank you for playing 21!')