require_relative 'node.rb'
require_relative 'trie.rb'

class CompleteMe

  def insert(word)
    trie = Trie.new
    trie.insert_words(word)
  end

  def load_dictionary

    dictionary_string = File.read("/usr/share/dict/words")

    dictionary = dictionary_string.split("\n")
  
  end

end
