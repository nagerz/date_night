require './lib/new_node'
require './lib/movie_generator'
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

  def max(max_node = @root)
    if max_node.nil?
      return nil
    elsif max_node.right.nil?
      return {max_node.title => max_node.score}
    else
      max(max_node.right)
    end
  end

  def min(min_node = @root)
    if min_node.nil?
      return nil
    elsif min_node.left.nil?
      return {min_node.title => min_node.score}
    else
      min(min_node.left)
    end
  end

  # def sort(current_node = @root, current_score = 0)
  #   sort_hash = Hash.new
  #   if current_node.nil?
  #     return nil
  #   elsif current_node.left.nil?
  #     sort_hash << {current_node.title => min_node.score}
  #   else
  #     min(min_node.left)
  #   end
  # end

  def sort(current_node = @root, sort_array = [])
    if current_node.nil?
      return sort_array
    else
      sort(current_node.left, sort_array)
      sort_array << {current_node.title => current_node.score}
      sort(current_node.right, sort_array)
      sort_array
    end
  end

  def load(textfile)
    movies = MovieGenerator.new(textfile).make_movies_array
    movies.each do |movie|
      insert(movie[0], movie[1])
    end
    movies.count
  end

end
