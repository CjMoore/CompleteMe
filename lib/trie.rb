require_relative 'node.rb'
require 'pry'

class Trie
  attr_accessor :root

  def initialize
    @root = Node.new
    @return_word = []
    @suggest = []
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

    def search_trie(prefix, current_node=@root)
      letter = prefix[0] if prefix.class == String
      # @return_word << letter
      # binding.pry
      unless current_node.leaf_node
        current_node = current_node.children[letter]
        # binding.pry
          new_letter = check_prefix_empty(prefix[1..-1], current_node)
        # new_letter = prefix[1..-1]
        # if new_letter.empty?
        #   new_letter = current_node.children.keys[0]
        # end
        search_trie(new_letter, current_node)
      # end
      end
    # @suggest
    # <<
    @return_word
  end

  def check_prefix_empty(prefix, current_node)
    # new_letter = prefix
    if prefix.empty?
      # new_letter = check_current_node_has_many_children(prefix, current_node)
      if current_node.children.keys.length == 1
        new_letter = current_node.children.keys[0]
        @return_word << new_letter
      else
        current_node.children.keys.each do |letter|
          new_letter = letter
          @return_word << new_letter
        end
      end
    else
      new_letter = prefix
    end
    # @return_word << new_letter
    new_letter
  end

  # def check_current_node_has_many_children(prefix, current_node)
  #   if current_node.children.keys.length == 1
  #     new_letter = current_node.children.keys[0]
  #   else
  #     current_node.children.keys.each do |letter|
  #       new_letter = letter
  #       # @return_word << new_letter
  #     end
  #   end
  # end


end
