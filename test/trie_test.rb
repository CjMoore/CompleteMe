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

    def test_search_trie_can_return_last_letters_of_inserted_word
      skip
      trie = Trie.new
      trie.insert_words("pizza")

      assert_equal ["z", "a"], trie.search_trie("piz")
    end

    def test_search_trie_returns_last_letter_of_three_letter_inputs
      skip
      trie = Trie.new
      trie.insert_words("car")
      trie.insert_words("cat")
      trie.insert_words("cab")

      p trie.search_trie("ca")

      assert_equal ["r", "t", "b"], trie.search_trie("ca")
    end

    def test_prefix_search_can_return_node_of_prefix_end
      trie = Trie.new
      trie.insert_words("pat")
      trie.insert_words("park")
      trie.insert_words("parm")
      trie.insert_words("part")
      trie.insert_words("party")
      trie.insert_words("parted")

      assert_equal trie.root.children["p"].children.values, trie.prefix_search("pa")
    end

end
