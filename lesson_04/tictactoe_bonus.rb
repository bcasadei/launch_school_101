# tictactoe.rb
require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]].freeze       # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

current_player = 'Player'
score = { 'player' => 0, 'computer' => 0 }

def prompt(message)
  puts("=> #{message}")
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER} and Computer is #{COMPUTER_MARKER}."
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def reset_score(score)
  score['player'] = 0
  score['computer'] = 0
end

def update_score(winner, score)
  if winner == 'Player'
    score['player'] += 1
  elsif winner == 'Computer'
    score['computer'] += 1
  end
  match_winner(score)
end

def match_winner(score)
  if score['player'] >= 5
    prompt('You won the match!')
    reset_score(score)
  elsif score['computer'] >= 5
    prompt('Computer won the match!')
    reset_score(score)
  else
    prompt('The first to 5 matches wins')
    prompt("You: #{score['player']}, Computer: #{score['computer']}.")
  end
end

def joinor(brd, sep = ' ,', conj = 'or')
  string = empty_squares(brd).join(sep + ' ')
  return string if empty_squares(brd).size <= 1
  string.slice(0..-2) + conj + ' ' + string.slice(-1)
end

def alternate_player(current_player)
  # alternate current player variable
  return 'Computer' if current_player == 'Player'
  'Player'
end

def place_piece!(board, current_player)
  if current_player == 'Player'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(brd, ',', 'or')}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(line[0], line[1], line[2]).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

# rubocop:disable Metrics/MethodLength, IfUnlessModifier
def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  unless square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  unless square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/MethodLength, IfUnlessModifier

def board_full?(brd)
  empty_squares(brd).empty?
end

# rubocop:disable Metrics/DoubleNegation
def someone_won?(brd)
  !!detect_winner(brd)
end
# rubocop:enable Metrics/DoubleNegation

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do # match loop
  board = initialize_board

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt("#{detect_winner(board)} won!")
    update_score(detect_winner(board), score)
  else
    prompt("It's a tie!")
  end
  prompt('Keep playing? (y or n)')
  answer = gets.chomp
  loop do
    break if %w(y n Y N).include?(answer)
    prompt("That's not a valid choice. Please answer (y or n).")
    answer = gets.chomp
  end
  break unless answer.downcase.start_with?('y')
end
prompt('Thanks for playing Tic-Tac-Toe!')
