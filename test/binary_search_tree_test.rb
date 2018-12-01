require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

  def test_tree_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end
end
