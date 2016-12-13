require_relative 'node.rb'
require 'pry'

class Trie
  attr_accessor :root

  def initialize
    @count = 0
    @root = Node.new
    #roots are all the beginning nodes of a word
  end

  def populate
  end

  def insert_words(word, current_node=@root)
    word = word.downcase
    #any roots exist set it to first letter of word
    first_letter = word[0]
    # current_node.children[first_letter] = new_child.children
    if current_node.children.keys.include?(first_letter)
      current_node = current_node.children[first_letter]
      insert_words(word[1..-1], current_node)
    else
      #create new node using (node, word)
      current_node.children[first_letter] = create_node(Node.new, word[1..-1])
    end
  end

    def create_node(node, word)
      if word.length > 0
        node.children[word[0]] = Node.new
        next_node = node.children[word[0]]
        create_node(next_node, word[1..-1])

      else
        node.leaf_node = true
      end

      node
    end

    # def break_up_chars(word)
    #   word.chars.each do |char|
    #
    #     child_node = Node.new
    #     current_node.children[char] = child_node
    #
    # end
end
