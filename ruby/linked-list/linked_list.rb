# frozen_string_literal: true

# rubocop:disable Style/Documentation
class Node
  attr_accessor :data, :prev_node, :next_node

  def initialize(data, prev_node: nil, next_node: nil)
    @data = data
    @prev_node = prev_node
    @next_node = next_node
  end

  def append(element)
    self.next_node = Node.new(element, prev_node: self, next_node: next_node)
  end
end

class Deque
  attr_accessor :head

  def initialize
    @head = nil
  end

  def tail
    node = head
    loop do
      break unless node.next_node

      node = node.next_node
    end
    node
  end

  def push(element)
    if head
      tail.append(element)
    else
      self.head = Node.new(element)
    end
  end

  def pop
    data = tail.data
    second_to_last_node = tail.prev_node
    if second_to_last_node
      second_to_last_node.next_node = nil
    else
      self.head = nil
    end
    data
  end

  def shift
    data = head.data
    self.head = head.next_node
    data
  end

  def unshift(element)
    node = Node.new(element, next_node: head)
    head.prev_node = node if head
    self.head = node
  end
end
# rubocop:enable Style/Documentation
