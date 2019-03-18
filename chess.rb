class Node
  def initialize position
    @position = position
    @possible_moves = []
    @possible_moves.push(position+[1,2]) if (position+[1,2]).none{|a| a<0 || a>8}
end

print [0,0] + [1,2] 