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

  def test_include
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal true, tree.include?(16)
    assert_equal true, tree.include?(50)
    assert_equal false, tree.include?(72)
  end

  def test_depth_of
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
    assert_equal nil, tree.depth_of(4)
  end

  def test_max_and_min
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    max_expected = {"Sharknado 3" => 92}
    min_expected = {"Johnny English"=>16}

    assert_equal max_expected, tree.max
    assert_equal min_expected, tree.min
  end

  def test_sort
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    sort_hash = [{"Johnny English"=>16},
      {"Hannibal Buress: Animal Furnace"=>50},
      {"Bill & Ted's Excellent Adventure"=>61},
      {"Sharknado 3"=>92}]

    assert_equal sort_hash, tree.sort
  end

  def test_load
    tree = BinarySearchTree.new

    assert_equal 99, tree.load('./lib/movies.txt')

    assert_equal true, tree.include?(16)
    assert_equal 3, tree.depth_of(67)
    assert_equal 2, tree.depth_of(11)
    assert_equal 5, tree.depth_of(58)
    assert_equal 4, tree.depth_of(86)

    max_expected = {"The Little Engine That Could" => 100}
    min_expected = {"Cruel Intentions"=>0}
    assert_equal max_expected, tree.max
    assert_equal min_expected, tree.min
  end

end
