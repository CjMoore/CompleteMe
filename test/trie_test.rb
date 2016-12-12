require 'minitest/autorun'
require 'minitest/pride'
require './lib/trie.rb'

class TrieTest < MiniTest::Test

  # def test_current_node_nil_by_default
  #   trie = Trie.new
  #   trie.insert_words("pizza")

    def test_create_node_makes_node_when_insert_word
      trie = Trie.new

      trie.insert_words("a")

      assert_equal count = 1
      assert_equal trie.root.children.keys, ["a"]
    end
end
