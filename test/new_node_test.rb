require 'minitest/autorun'
require 'minitest/pride'
require './lib/new_node'

class NewNodeTest < Minitest::Test

  def test_node_exists
    root = NewNode.new(1, "test")

    assert_instance_of NewNode, root
  end

  def test_node_data
    root = NewNode.new(1, "test")

    assert_equal 1, root.score
    assert_equal "test", root.title
  end

  def test_branches_nil
    root = NewNode.new(1, "test")

    assert_equal nil, root.left
    assert_equal nil, root.right
  end
  
end
