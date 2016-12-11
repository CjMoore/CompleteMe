class Node
  attr_accessor :leaf_node, :link, :keys, :value

  def initialize
    @leaf_node = false
    @link = Hash.new
    @keys = Array.new
    @value = ""
  end

end
