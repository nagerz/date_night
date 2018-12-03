require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

  def test_tree_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end

  def test_init_root_nil
    tree = BinarySearchTree.new

    assert_equal nil, tree.root
  end

  # def test_new_node_exists
  #   tree = BinarySearchTree.new
  #   node = tree.insert(61, "Bill & Ted's Excellent Adventure")
  #
  #   assert_instance_of NewNode, node
  #   assert_equal 0, depth
  # end

  def test_make_root_node
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal nil, tree.root.left
    assert_equal nil, tree.root.right
    assert_equal 61, tree.root.score
    assert_equal "Bill & Ted's Excellent Adventure", tree.root.title
  end

  def test_tree_insert
    tree = BinarySearchTree.new

    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado 3")
    assert_equal 2, tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_left_right_nodes_made
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 16, tree.root.left.score
    assert_equal "Sharknado 3", tree.root.right.title
    assert_equal 50, tree.root.left.right.score
    assert_equal nil, tree.root.left.right.left
  end

  # def test_tree_include
  #   tree = BinarySearchTree.new
  #   tree.insert(61, "Bill & Ted's Excellent Adventure")
  #   tree.insert(16, "Johnny English")
  #   tree.insert(92, "Sharknado 3")
  #   tree.insert(50, "Hannibal Buress: Animal Furnace")
  #
  #   assert_equal true, tree.include?(16)
  #   assert_equal false, tree.include?(72)
  # end
end
