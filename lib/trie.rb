require_relative 'node.rb'

class Trie
  attr_accessor :root

  def initialize
    @count = 0
    @root = Node.new("")
    #roots are all the beginning nodes of a word
  end

  # def root
  #   @root = Node.new
  # end

  def insert_words(word, current_node=nil)
    word = word.downcase
    #any roots exist set it to first letter of word
    current_node = @root
    first_letter = word[0]
    # current_node.children[first_letter] = new_child.children
    new_child = current_node.children.keys[0]
    if new_child
      #recursively go through word
      insert_words(word[1..-1], new_child.children)
    else
      #create new node using (node, word)
      current_node.children[first_letter] = create_node(Node.new(new_child), word[1..-1])
    end
  end

    def create_node(node, word)
      #create a new node with first letter
      if word
        #create a new child node with first letter
        new_child = Node.new(word[0])
        #next letter gets put in to next child
        node.children[word[0]] = new_child
        #recursively go through word until its all done
        create_node(new_child, word[1..-1])
      else
        #when that's done return node
        node.leaf_node = true
      end
    end

    # def break_up_chars(word)
    #   word.chars.each do |char|
    #
    #     child_node = Node.new
    #     current_node.children[char] = child_node
    #
    # end
end
