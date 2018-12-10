# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
      WIN_COMBINATIONS.each do |combo|
      index1 = combo[0]
      index2 = combo[1]
      index3 = combo[2]

      @pos1 = board[index1]
      @pos2 = board[index2]
      @pos3 = board[index3]

      if empty?(board) == false
        return false
      elsif draw?(board) == false
        return false
      elsif @pos1 == "X" && @pos2 == "X" && @pos3 == "X"
        return combo
      elsif @pos1 == "O" && @pos2 == "O" && @pos3 == "O"
        return combo
      else false
      end
    end
  end

def empty?(board)
  board.any? do |space|
  space == "X" || space ==  "O"
end
end

def full?(board)

  board.all? do |space|
  space == "X" || space ==  "O"
    end
end

def draw?(board)

  if full?(board) == true && won?(board) == false
    return false
  elsif full?(board) == false && won?(board) == false
    return false

    end
end

def over?(board)

if won?(board) != false
  return true
elsif draw?(board) == true
  return true
else
  return false
end
end


def winner(board)
  if won?(board) != false
    if @pos1 == "X"
      return "X"
    elsif @pos1 == "O"
      return "O"
    end
  elsif draw?(board) == true
      return nil
  end
end
