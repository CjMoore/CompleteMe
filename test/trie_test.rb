require 'minitest/autorun'
require 'minitest/pride'
require './lib/trie.rb'
require 'pry'


class TrieTest < MiniTest::Test

  def test_trie_root_is_node
    trie = Trie.new

    assert_equal trie.root.class, Node
  end

    def test_create_node_can_insert_single_letter_word
      trie = Trie.new
      trie.insert_words("a")

      assert_equal trie.root.children.keys, ["a"]
      assert_equal trie.root.children["a"].class, Node
    end

    def test_single_letter_word_creates_leaf_node
      trie = Trie.new
      trie.insert_words("a")

      assert_equal trie.root.children["a"].leaf_node, true
    end

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
      # binding.pry

      assert_equal trie.root.children.keys, ["p"]
      assert_equal trie.root.children["p"].children.keys, ["i"]
      assert_equal trie.root.children["p"].children["i"].children["z"].children["z"].children.keys, ["a"]
    end

    def test_insert_can_insert_two_words_with_same_starting_letter
      trie = Trie.new
      trie.insert_words("hat")
      trie.insert_words("ham")

      assert_equal trie.root.children["h"].children.keys, ["a"]
      assert_equal trie.root.children["h"].children["a"].children.keys, ["t", "m"]
    end

    def test_insert_can_insert_two_words_with_different_starting_letters
      trie = Trie.new
      trie.insert_words("hat")
      trie.insert_words("cat")

      assert_equal trie.root.children.keys, ["h", "c"]
    end


end
