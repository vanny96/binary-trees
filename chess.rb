class Position
  attr_accessor :parent, :position, :possible_moves

  def initialize position, parent=nil
    @parent = parent
    @position = position
    @possible_moves = possible_positions
  end

  def possible_positions 
    possible_moves = []
    
      
    possible_moves <<  [@position,[1,2]].transpose.map{|a| a.sum}
    possible_moves <<  [@position,[2,1]].transpose.map{|a| a.sum}
    possible_moves <<  [@position,[2,-1]].transpose.map{|a| a.sum}
    possible_moves <<  [@position,[1,-2]].transpose.map{|a| a.sum}
    possible_moves <<  [@position,[-1,-2]].transpose.map{|a| a.sum}
    possible_moves <<  [@position,[-2,-1]].transpose.map{|a| a.sum}
    possible_moves <<  [@position,[-2,1]].transpose.map{|a| a.sum}
    possible_moves <<  [@position,[-2,2]].transpose.map{|a| a.sum}
  
      
    possible_moves = possible_moves.filter do |position|
      position[0]<8 && position[0]>-1 && position[1]<8 && position[1]>-1
    end

    possible_moves
  end

  def route root
    route = []
    position = self
    until position.position == root
      route << position.position
      position = position.parent
    end    
    route << position.position

    route.reverse
  end
end

def knight_moves position, destination
  root = Position.new position
  queue = [root]

  loop do
    break if queue[0].position == destination
    queue[0].possible_moves.each do |new_position|
      queue << Position.new(new_position, queue[0])
    end
    queue.shift
  end
  route = queue[0].route position
  puts "To move from #{position} to #{destination} takes #{route.length - 1} moves!\n"
  route.each do |move|
    print "#{move}\n"
  end
end


knight_moves [0,0],[7,7]
