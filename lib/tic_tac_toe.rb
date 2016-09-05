class TicTacToe
  def initialize (board=nil)
    @board = board
    @board = [" "," "," "," "," "," "," "," "," "]
  end
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(user_input="0")
  input = user_input.to_i
  index = input - 1
end


def position_taken?(index)
  !(@board[index] == " "|| @board[index] == "" || @board[index]== nil)
end

def valid_move?(index)
  index.between?(0,8) == true && position_taken?(index) == false
end



def turn_count
  counter=0
  @board.each do |spot|
    if spot == "X" || spot == "O"
      counter+=1
    end
  end
    return counter
end


def current_player
  if turn_count % 2 == 0
    return "X"
  else return "O"
end
end


def move(index, token)
  @board[index]= token
end


def turn
  puts "Please enter 1-9:"
  user_input=gets.chomp
  index = input_to_index(user_input)
  if valid_move?(index)
    token = current_player
    move(index,token)
    display_board
  else turn
  end
end


WIN_COMBINATIONS= [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]
]


def won?
WIN_COMBINATIONS.each do |win_combination|
win_index_1 = win_combination[0]
win_index_2 = win_combination[1]
win_index_3 = win_combination[2]
position_1 = @board[win_index_1]
position_2 = @board[win_index_2]
position_3 = @board[win_index_3]
if position_1 == "X" && position_2 == "X" && position_3 == "X"
  return win_combination
elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  return win_combination
end
end
return false
end


def full?
  @board.all? do |space|
    space != " "
  end
end


def draw?
  won_answer = won?
  full_answer = full?
  won_answer == false && full_answer == true
end


def over?
  draw? == true || won? != false
end


def winner
  if won? != false
    win_combo = won?
    @board[win_combo[0]]
  end
end

def play
  until over? == true
    turn
  end
  if won? != false
    winner_token=winner
    puts "Congratulations #{winner_token}!"
  elsif draw? == true
    puts "Cats Game!"
end
end
end
