require_relative 'node.rb'

class CompleteMe

  attr_reader :count, :root

  def initialize
    @count = 0
    @root = nil
  end

  def insert(word)

    if root.nil?
      root = Node.new
      root.insert_words(word)
      @count += 1
    else
      insert_words(word)
    end
  end

  def insert_words(word)

   word.chars.each do |char|

     current_node = Node.new
     current_node.key << char
     current_node.link.key = char
   end
 end

 #
 # def populate(dictionary)
 #   dictionary.split
end
