require 'minitest/autorun'
require 'minitest/pride'
require './lib/complete_me.rb'
require 'pry'

class CompleteMeTest < MiniTest::Test

  def test_cm_can_create_trie
    cm = CompleteMe.new

    assert_equal cm.trie.class, Trie
  end

  def test_cm_can_insert_words
    cm = CompleteMe.new
    cm.insert("cat")

    assert_equal cm.trie.root.children.keys, ["c"]
  end

  def test_cm_can_insert_several_words_trie_stays_organized
    cm = CompleteMe.new
    cm.insert("cat")
    cm.insert("bar")

    assert_equal cm.trie.root.children.keys, ["c", "b"]
  end

  def test_insert_count_is_zero_by_default
    cm = CompleteMe.new

    assert_equal 0, cm.count
  end

  def test_insert_increases_count_by_one
    cm = CompleteMe.new
    cm.insert("cat")

    assert_equal 1, cm.count
  end

  def test_insert_increases_count_by_three
      cm = CompleteMe.new
      cm.insert("cat")
      cm.insert("dog")
      cm.insert("chinchilla")

      assert_equal 3, cm.count
  end

  def test_populate_can_insert_one_word
    cm = CompleteMe.new
    cm.populate("cat")

    assert_equal 1, cm.count
    assert_equal cm.trie.root.children.keys, ["c"]
  end

  def test_populate_with_medium_dictionary
    cm = CompleteMe.new
    cm.populate("cat\nbat\nbeer\ndog")

    assert_equal 4, cm.count
  end
  def test_populate_can_insert_large_dictionary
    cm = CompleteMe.new
    dictionary_1 = File.read("/usr/share/dict/words")
    # binding.pry
    cm.populate(dictionary_1)

    assert_equal 235886, cm.count
  end

  # def test_counts_the_words_in_dictionary
  #   assert_equal 235886, CompleteMe.new.load_dictionary.count
  # end

  # def test_word_can_be_split_up_into_chars
  #   trie = CompleteMe.new
  #   assert_nil
  # end

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
