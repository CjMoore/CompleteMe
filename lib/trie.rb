require_relative 'node.rb'
require 'pry'

class Trie
  attr_accessor :root, :original_prefix

  def initialize
    @root = Node.new
    @return_words = []
  end

  def insert_words(word, current_node=@root)
    word = word.downcase
    #any roots exist set it to first letter of word
    first_letter = word[0]

    if current_node.children.keys.include?(first_letter)
      current_node = current_node.children[first_letter]
      if word == first_letter
        insert_words(word, current_node)
      else
        insert_words(word[1..-1], current_node)
      end
    else
      #create new node using (node, word)
      current_node.children[first_letter] = create_node(Node.new, word[1..-1])
    end
  end

  def create_node(node, word)
    if word.length > 0 && word != nil
      node.children[word[0]] = Node.new

      next_node = node.children[word[0]]
      create_node(next_node, word[1..-1])
    else
      node.leaf_node = true
    end
      node
  end
end
