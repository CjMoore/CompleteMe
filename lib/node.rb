class Node
  attr_accessor :leaf_node, :children

  def initialize(leaf_node = false)
    @children   = {}
    @leaf_node  = leaf_node
  end

end
