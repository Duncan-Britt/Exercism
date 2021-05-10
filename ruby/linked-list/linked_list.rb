# frozen_string_literal: true

require 'pry'
require 'pry-byebug'

# rubocop:disable Style/Documentation
class Node
  attr_accessor :data, :pred, :succ

  def initialize(data, pred: nil, succ: nil)
    @data = data
    @pred = pred
    @succ = succ
  end

  def append(element)
    self.succ = Node.new(element, pred: self, succ: succ)
  end

  def to_s
    return data.to_s if data

    'nil'
  end
end

class Deque
  attr_reader :head, :tail

  def initialize(len = 0, element = nil)
    @head = nil
    @tail = nil
    if len.class == Range
      populate(len)
    else
      len.times do
        push(element)
      end
    end
  end

  def tail(node = head)
    return node unless node.succ

    tail(node.succ)
  end

  def [](index, count = 0, node = head)
    return index_range(index) if index.class == Range
    return negative_idx(index) if index < 0
    return node if count == index
    return unless node.succ

    self[index, count + 1, node.succ]
  end

  def []=(idx, element)
    self[idx].data = element
  end

  def negative_idx(idx, count = -1, node = tail)
    return node if count == idx
    return unless node.pred

    negative_idx(idx, count - 1, node.pred)
  end

  def push(element)
    if head
      tail.append(element)
    else
      self.head = Node.new(element)
    end
    self
  end

  def slice(beg_idx, n_idcs)
    result = Deque.new
    node = self[beg_idx]
    return unless node

    i = 0
    loop do
      break if i == n_idcs
      result.push(node)
      return result unless node.succ
      node = node.succ
      i += 1
    end
    result
  end

  def pop
    return unless head

    data = tail.data
    second_to_last_node = tail.pred
    if second_to_last_node
      second_to_last_node.succ = nil
    else
      self.head = nil
    end
    data
  end

  def shift
    return unless head

    data = head.data
    self.head = head.succ
    data
  end

  def unshift(element)
    node = Node.new(element, succ: head)
    head.pred = node if head
    self.head = node
    self
  end

  def to_s(node = head, str = '')
    return '(' + str + ')' unless node

    if str == ''
      str += node.to_s
    else
      str += (' <> ' + node.to_s)
    end
    to_s(node.succ, str)
  end

  private

  attr_writer :head, :tail

  def index_range(range)
    slice(range.begin, range.size)
  end

  def populate(range)
    range.end.downto(range.begin) do |e|
      unshift(e)
    end
  end
end
# rubocop:enable Style/Documentation

# deque = Deque.new(0..9)
# puts deque
# deque[5] = 'T'
# puts deque

# arr = (0..9).to_a
# p arr
# arr[5] = 'T'
# p arr


# deque = Deque.new(5, 'a')
# puts deque
# deque.push(5)
# nums = Deque.new(10, 5) #{ |e| e = e * 2 }
# puts nums
# deque.unshift('f')
# deque.unshift('e')
# deque.unshift('d')
# deque.unshift(nil)
# deque.unshift('b')
# deque.unshift('a')

# puts deque[0]
# puts deque[5]
# puts deque[-6]
# puts deque.slice(-9, 9)
# puts deque
# puts deque[-3..-1]
# puts deque[-3..5]
# puts deque[3..5]
# puts deque.inspect
# puts deque.push(10)
# puts deque.unshift(20)
# puts deque.pop
# puts deque

# p deque.pop
# p deque.pop
# p deque.shift
# puts deque
# deque.push(10)
# deque.unshift(20)
# deque.unshift(30)
# puts deque
