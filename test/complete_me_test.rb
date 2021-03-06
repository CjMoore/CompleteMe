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
    cm.populate(dictionary_1)

    assert_equal 235886, cm.count
  end

  def test_can_suggest_using_inserted_word

  cm = CompleteMe.new
  cm.insert("pizza")

  assert_equal ["pizza"], cm.suggest("piz")
  end

  def test_can_suggest_suggest_two_words
    skip
    cm = CompleteMe.new
    cm.populate("can\ncar\ncat")

    assert_equal ["can", "car", "cat"], cm.suggest("ca")
  end

  def test_can_suggest_several_words_with_big_trie
    skip
    cm = CompleteMe.new
    dictionary_1 = File.read("/usr/share/dict/words")
    cm.populate(dictionary_1)

    assert_equal ["pizzeria", "pizza", "pizzicato", "pizzle", "pize"], cm.suggest("piz")
  end

  def test_it_can_suggest_after_three_letters_suggested
    skip
    cm = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    cm.populate(dictionary)

    cm.select("piz", "pizzicato")
    cm.select("piz", "pizzeria")
    cm.select("piz", "pizza")
    assert_equal ["pizza", "pizzeria", "pizzicato"], cm.suggest("piz")
  end
end
