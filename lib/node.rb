# frozen_string_literal: true

# lib/node.rb

class Node
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
    @next = nil
  end
end
