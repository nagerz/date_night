require './new_node'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(score, title)
    current_node = @root
    depth = 0
    loop do
      if current_node.nil?
        current_node = NewNode.new(score, title)
        #return depth
        break
      else
        depth += 1
        if score <= current_node.score
          if current_node.left.nil?
            current_node.left = NewNode.new(score, title)
            break
          else
            current_node = current_node.left
            #loop
          end
        elsif score >= current_node.score
          if current_node.right.nil?
            current_node.right = NewNode.new(score, title)
            break
          else
            current_node = current_node.right
            #loop
          end
        else
          return "Duplicate score attempted"
          #break
        end
      end
      return depth
      end
  end

end
