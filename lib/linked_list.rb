# frozen_string_literal: true

require_relative 'node'

# Collection of Node objects that each point to the next Node in the list.
class LinkedList
  attr_reader :head, :size, :tail

  def initialize
    @size = 0
  end

  def append(value)
    new_node = Node.new value
    if head
      tail.next_node = new_node
    else
      @head = new_node
    end
    @tail = new_node
    @size += 1
    new_node
  end

  def prepend(value)
    new_node = Node.new value, head
    @head = new_node
    @size += 1
    new_node
  end

  def at(index)
    node = head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    last = tail
    second_to_last = at(size - 2)
    second_to_last.delete_next
    @size -= 1
    @tail = second_to_last
    last
  end

  def contains?(value)
    each { |node| return true if node.value == value }
    false
  end

  def find(value)
    each_with_index do |node, index|
      return index if node.value == value
    end
    nil
  end

  def to_s
    string = ''
    each { |node| string += "( #{node.value} ) -> " }
    string += 'nil'
    string
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?
    return append(value) if index == size

    previous_node = at index - 1
    current_node = previous_node.next_node
    new_node = Node.new value, current_node
    previous_node.next_node = new_node
    @size += 1
    new_node
  end

  def each
    node = head
    size.times do
      yield node
      node = node.next_node
    end
  end

  def each_with_index
    node = head
    size.times do |index|
      yield node, index
      node = node.next_node
    end
  end
end
