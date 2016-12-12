require_relative 'node.rb'

class Trie

  def initialize
    @count = 0
    @root = nil
    @parents = {}
    #roots are all the beginning nodes of a word
  end
  #
  # def insert(word)
  #
  #   if root.nil?
  #     root = Node.new
  #     root.insert_words(word)
  #     # @count += 1
  #   else
  #     insert_words(word)
  #   end
  # end



  def insert_words(word, current_node)

    word = word.downcase

    #if any roots exist set it to first letter of word
    current_node ||= @parents
      first_letter = word[0]
      new_child = current_node[first_letter]
    if new_child
      #recursively go through word
      insert_word(word[1..-1], new_child.children)
    else
      #create new node using (node, word)
      at[new_child] = create_node(Node.new(new_child), word[1..-1])
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
