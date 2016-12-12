class Node
  attr_accessor :leaf_node, :link

  def initialize
    @children = Hash.new
    @leaf_node = false
    @letter = letter
  end

end
