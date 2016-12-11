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
      insert_words(word)
    else
      insert_words(word)
    end
  end

  def insert_words(word)

   word.char.each do |char|
     current_node = Node.new
     current_node.keys << char
   end


 end

end
