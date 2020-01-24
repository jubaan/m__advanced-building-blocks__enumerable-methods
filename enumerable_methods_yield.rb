# Project 2: Enumerable Methods
module Enumerable
  def my_each
    length.times { |i| yield at(i) } and self if block_given?
    to_enum
  end

  def my_each_with_index
    my_each { |i| yield i } and self if block_given?
    to_enum
  end

  def my_select
    selection = []
    my_each { |item| selection << item if yield item } and selection if block_given?
    to_enum
  end

  def my_map
    mapped = []
    my_each { |item| mapped << (yield item) ? true : false } and mapped if block_given?
    to_enum
  end
end
