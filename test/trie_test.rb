require 'minitest/autorun'
require 'minitest/pride'
require './lib/trie.rb'
require 'pry'


class TrieTest < MiniTest::Test

  # def test_current_node_nil_by_default
  #   trie = Trie.new
  #   trie.insert_words("pizza")

  def test_trie_root_is_node
    trie = Trie.new

    assert_equal trie.root.class, Node
  end

    def test_create_node_can_insert_single_letter_word
      trie = Trie.new
      trie.insert_words("a")
      # binding.pry

      assert_equal trie.root.children.keys, ["a"]
      assert_equal trie.root.children["a"].class, Node
    end
    #
    # def test_single_letter_word_creates_leaf_node
    #   trie = Trie.new
    #   trie.insert_words("a")
    #
    #   assert_equal trie.root.children.values[0], {}
    # end

    def test_create_node_can_insert_two_letter_word
      trie = Trie.new
      trie.insert_words("it")

      assert_equal trie.root.children.keys, ["i"]
      assert_equal trie.root.children["i"].children.keys, ["t"]
      # binding.pry
    end

    def test_insert_can_create_nodes_for_five_letter_word

      trie = Trie.new
      trie.insert_words("pizza")
      binding.pry
      # assert_equal

    end
end
