require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < MiniTest::Test

  def test_leaf_node_is_false_by_default
    node = Node.new
    refute node.leaf_node
  end

  def test_link_is_a_hash
    node = Node.new
    assert_equal Hash, node.link.class
  end

  def test_keys_are_an_empty_array
    node = Node.new
    assert_equal Array, node.key.class
  end

  def test_initial_value_is_an_empty_string
    node = Node.new
    assert_equal "", node.value
  end
end
