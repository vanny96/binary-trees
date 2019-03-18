class Node
  attr_accessor :parent, :value, :left_children, :right_children

  def initialize value
    @value = value
  end
end
class BinaryTree
	attr_accessor :root, :tree
		def initialize array
			@node = build_tree array
		end		

		def build_tree array
			root = Node.new array[0]
		
			array.each_with_index do |element, index|
				next if index == 0
				
				selected_node = root
				new_node = Node.new element
		
				loop do
					if new_node.value < selected_node.value
						if selected_node.left_children.nil?
							selected_node.left_children = new_node
							new_node.parent = selected_node
							break
						else
							selected_node = selected_node.left_children
						end
					else 
						if selected_node.right_children.nil?
							selected_node.right_children = new_node
							new_node.parent = selected_node
							break
						else
							selected_node = selected_node.right_children
						end
					end
				end
			end
			root
		end
end
	

def breath_first_search array, value
	tree = build_tree array
	queue = [tree.root]

	until queue.empty?
		return queue[0] if queue[0].value == value

		queue << queue[0].left_children unless queue[0].left_children.nil?
		queue << queue[0].right_children unless queue[0].right_children.nil?

		queue.shift
	end
	return nil
end

def dfs_rec array, value
	tree = build_tree
end