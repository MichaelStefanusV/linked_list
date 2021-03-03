# frozen_string_literal: true

# lib/linked_list.rb

require_relative 'node'

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end

  def size
    node = @head
    count = 1
    until node.next.nil?
      count += 1
      node = node.next
    end
    count
  end

  attr_reader :head, :tail

  def at(index)
    node = @head
    count = 0
    until count == size
      return node.value if index == count
      count += 1
      node = node.next
    end
  end

  def pop
    node = @head
    node = node.next until node.next == @tail
    temp = node.next
    node.next = nil
    @tail = node
    temp.value
  end

  def find(value)
    node = @head
    index = 0
    until index == size
      return index if value == node.value

      index += 1
      node = node.next
    end
  end

  def contains?(value)
    node = @head
    result = false
    count = 0
    until count == size
      result = true if value == node.value
      node = node.next
      count += 1
    end
    result
  end

  def to_s
    node = @head
    count = 0
    result = " "
    until count == size
      result += "( #{node.value} ) -> "
      count += 1
      node = node.next
    end
    result += "nil"
  end

  def insert_at(value, index)
    count = 0
    node = @head
    if index == 0
      prepend(value)
    elsif index >= size
      append(value)
    else
      while count < index-1
        node = node.next
        count += 1
      end
      temp = Node.new(value) #temporary node for the new node that we want to add
      temp2 = node.next #temporary node for the current node that resides at the index
      node.next = temp
      temp.next = temp2
    end
  end

  def remove_at(index)
    count = 0
    node = @head
    if index >= size 
      pop()
    elsif index == 0
      temp = node.next
      @head.next = nil
      @head = temp
    else
      while count < index
        if count == index-1
          node.next = node.next.next
        end
        node = node.next
        count += 1
      end
    end
  end
end

list = LinkedList.new
list.append(199)
list.append(200)
list.append(300)
list.pop
list.prepend(2010)
puts "size = #{list.size}" 
puts "Index 2 value = #{list.at(2)}"
puts "Find 200 = #{list.find(200)}"
puts "contains 2010 = #{list.contains?(2010)}"
puts "contains 200 = #{list.contains?(200)}"
list.insert_at(230, 1)
list.remove_at(2)
puts list.at(1)
puts list.at(2)
puts list.at(0)
puts list.contains?(199)
puts list
