require_relative 'node.rb'

class Trie

  def initialize
    @count = 0
    @root = nil
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


  def create_tree

  end

  def insert_words(word, current_node)

    word = word.downcase

    if root.keys.include?(unique letter)

      current_node = @root
      break
        true/false
    end

    def break_up_chars(word)
      word.chars.each do |char|

        child_node = Node.new
        current_node.children[char] = child_node

    end
end
