class Node
  attr_accessor :leaf_node, :children, :letter

  def initialize(leaf_node = false)
    # @letter     = letter
    @children   = {}
    @leaf_node  = leaf_node
  end

end
