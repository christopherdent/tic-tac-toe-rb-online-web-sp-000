board = [" "," "," "," "," "," "," "," "," "]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]
  
  
def input_to_index(user_input)
  user_input.to_i - 1
end 


def move(board, user_input, character)
 board[user_input] = character
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
  true
    else 
      false
  end
end 



def turn(board)
  puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   character = current_player(board)
     if valid_move?(board, index)
      
      move(board, index, character)
      display_board(board)
   else
   turn(board)
  end
end


def turn_count(board)
 counter = 0
 board.each do |spot|
  if spot == "X" || spot == "O"
      counter += 1
    end
  end 
return counter
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end 



def won?(board)
  
WIN_COMBINATIONS.detect do |win_combination|
  index1 = win_combination[0]
  index2 = win_combination[1] 
  index3 = win_combination[2] 

  position_1 = board[index1]
  position_2 = board[index2]
  position_3 = board[index3]
  
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  else
    false
  end
   if position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end
 end
end

def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   end
end 

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
  return true
else
  return false
  end
end 

def over?(board)
if won?(board) || full?(board) || draw?(board)
  return true
else
  return false
  end
end




def play(board)
   until over?(board) 
      turn(board)
   end 
   
   if won?(board)
    puts "Congratulations #{winner(board)}!" 
    elsif draw?(board)
      puts "Cat's Game!" 
   end 
end
