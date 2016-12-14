require_relative 'node.rb'
require_relative 'trie.rb'

class CompleteMe
  attr_accessor :trie, :count

  def initialize
    @trie   = Trie.new
    @count  = 0
  end

  def insert(word)
    @count += 1
    trie.insert_words(word)
  end

  def populate(dictionary)
    if dictionary.empty?
      puts "empty!"
    else
      dictionary = dictionary.split("\n")
      dictionary.each do |word|
        insert(word) if word.class == String
      end
    end
  end

  def suggest(word)
    # list_of_letters = trie.search_trie(word)
    # puts list_of_letters
    if count > 1
      trie.search_trie(word).map do |letters|
        word + letters
      end
    else
      suggestion = Array.new
      suggestion << (word + trie.search_trie(word).join)
    end
    # suggestion = []
    #
    # puts trie.search_trie(word)
    #
    # suggestion << word + trie.search_trie(word).join


    # suggestion
  end
end
