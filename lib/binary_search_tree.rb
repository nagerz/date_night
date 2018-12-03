require './lib/new_node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(score, title)
    current_node = @root
    depth = 0
    loop do
      # if current_node.nil?
      #   #Why does current_node not work???
      #   current_node = NewNode.new(score, title)
      #   return depth
      if @root.nil?
        @root = NewNode.new(score, title)
        return depth
      else
        depth += 1
        if score < current_node.score
          if current_node.left.nil?
            current_node.left = NewNode.new(score, title)
            return depth
          else
            current_node = current_node.left
            #loop
          end
        elsif score > current_node.score
          if current_node.right.nil?
            current_node.right = NewNode.new(score, title)
            return depth
          else
            current_node = current_node.right
            #loop
          end
        else
          return "Duplicate score attempted"
          #break
        end
      end
      #depth
    end
  end


  def include?(score, node = @root)
    if node.nil?
      return false
    elsif score == node.score
      return true
    elsif score < node.score
      include?(score, node.left)
    else
      include?(score, node.right)
    end
  end

  def depth_of(score, node = @root, depth = 0)
    #depth = 0
    #loop do
      if node.nil?
        return nil
      elsif score == node.score
        return depth
      elsif score < node.score
        depth += 1
        depth_of(score, node.left, depth)
      else
        depth += 1
        depth_of(score, node.right, depth)
      end
      #depth
    #end
  end

end
