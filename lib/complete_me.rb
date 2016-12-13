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
      # dictionary = dictionary[0..50]
      dictionary = dictionary.split("\n")
      p dictionary
      dictionary.each do |word|
        p word
        insert(word) if word.class == String
      end
    end
  end
end
