class Node
  attr_accessor :parent, :value, :left_children, :right_children

  def initialize value
    @value = value
  end
end
class BinaryTree
	attr_accessor :root
	def initialize array
		@root = build_tree array
	end		

	private
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

	public
	def breath_first_search value
		queue = [@root]
	
		until queue.empty?
			return queue[0] if queue[0].value == value
	
			queue << queue[0].left_children unless queue[0].left_children.nil?
			queue << queue[0].right_children unless queue[0].right_children.nil?
	
			queue.shift
		end
		return nil
	end
	def dfs_rec value, node=@root
		return nil if node.nil?
		return node if node.value == value
		return dfs_rec value, node.left_children  unless dfs_rec(value, node.left_children).nil?
		return dfs_rec value, node.right_children unless dfs_rec(value, node.right_children).nil?
		return nil
	end
	def depth_first_search value
		stack = [@root]
		
		until stack.empty?
			node = stack.pop
			return node if node.value == value
			stack.push(node.right_children) if !node.right_children.nil?
			stack.push(node.left_children) if !node.left_children.nil?
		end
		return nil
	end
end
	

tree = BinaryTree.new  [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
puts tree.depth_first_search 13
