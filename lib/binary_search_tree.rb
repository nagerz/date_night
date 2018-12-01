class BinarySearchTree
  attr_reader :movies

  def initialize
    @movies = {}
  end

  def insert(score, title)
    if @movies.empty?
    @movies[score] = title
    less_keys_count = 0
    @movies.each_key do |key|
      if key < score
        less_keys_count += 1
      end
    end

  end
end
