require 'minitest/autorun'
require 'minitest/pride'
require './lib/complete_me.rb'

class CompleteMeTest < MiniTest::Test

  def test_initialize_count_as_zero
    trie = CompleteMe.new
    assert_equal 0, trie.count
  end

  def test_root_is_nil_by_default
    trie = CompleteMe.new
    assert_nil trie.root
  end

  def test_word_can_be_split_up_into_chars
    trie = CompleteMe.new
    assert_nil
  end

  # def test_can_create_node_for_first_character
  #   trie = CompleteMe.new
  #
  # end

#
# def test_can_insert_a_single_word_into_complete_me
#   trie = CompleteMe.new
#   assert_equal "pizza", trie.insert("pizza")
# end
end
