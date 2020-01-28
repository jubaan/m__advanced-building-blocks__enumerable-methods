# Project 2: Enumerable Methods
module Enumerable
  def my_each(&block)
    size.times { |i| block.call(self[i]) } and return self if block
    to_enum
  end

  def my_each_with_index(&block)
    my_each { |idx| block.call(self[idx], idx) } and return self if block_given?
    to_enum
  end

  def my_select(&block)
    selection = []
    my_each { |item| selection << item if block.call(item) } and return selection if block_given?
    to_enum
  end

  def my_map
    mapped = []
    my_each { |item| mapped << yield(item) if yield(item) != 0 } and return mapped if block_given?
    to_enum
  end

  def my_all?(args = nil, &block)
    swap = true
    if block
      my_each { |item| swap = false unless block.call(item) }
    elsif args.nil?
      my_each { |item| swap = false unless self[item] }
    else
      my_each { |item| swap = false unless args === self[item] }
      to_enum
    end
    swap
  end

  def my_any?(args = nil, &block)
    swap = false
    if block
      my_each { |item| swap = true if block.call(item) }
    elsif args.nil?
      my_each { |item| swap = true if item }
    else
      my_each { |item| swap = true if args === item }
      to_enum
    end
    swap
  end
end
