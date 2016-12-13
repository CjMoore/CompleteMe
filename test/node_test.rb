require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < MiniTest::Test

  def test_children_is_empty_hash_by_default
    node = Node.new

    assert_equal node.children, {}
  end

  def test_children_is_hash
    node = Node.new

    assert_equal node.children.class, Hash
  end

  def test_leaf_node_is_false_by_default
    node = Node.new

    assert_equal node.leaf_node, false
  end
end
