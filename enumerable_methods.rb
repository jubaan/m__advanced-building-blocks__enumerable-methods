require 'minitest/pride'

# Project 2: Enumerable Methods
module Enumerable
  def my_each(&block)
    to_enum
    length.times { |i| block.call(self[i]) } and self if block
  end

  def my_each_with_index(&block)
    to_enum
    my_each { |item| block.call(item) } if block
  end

  def my_select(&block)
    to_enum unless block
    selection = []
    my_each { |item| selection << item if block.call(item) }
    selection
  end

  def my_map(&block)
    to_enum
    mapped = []
    my_each { |item| mapped << block.call(item) } and return mapped if block
  end
end


array = [1,2,5,8,7,98,4]
p array.my_each_with_index {|x| x * 2}
