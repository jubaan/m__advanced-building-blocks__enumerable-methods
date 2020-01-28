# Project 2: Enumerable Methods
module Enumerable
  def my_each
    size.times { |i| yield(self[i]) } and return self if block_given?
    to_enum
  end

  def my_each_with_index
    my_each { |idx| yield(self[idx], idx) } and return self if block_given?
    to_enum
  end

  def my_select
    selection = []
    my_each { |item| selection << item if yield(item) } and return selection if block_given?
    to_enum
  end

  def my_map
    mapped = []
    my_each { |item| mapped << yield(item) if yield(item) != 0 } and return mapped if block_given?
    to_enum
  end

  def my_all?(args = nil)
    swap = true
    if block_given?
      my_each { |item| swap = false unless yield(item) }
    elsif args.nil?
      my_each { |item| swap = false unless self[item] }
    else
      my_each { |item| swap = false unless args === self[item] }
      to_enum
    end
    swap
  end
end
