# Project 2: Enumerable Methods
module Enumerable
  def my_each
    size.times { |i| yield(self[i]) } and return self if block_given?
    to_enum
  end

  def my_each_with_index
    size.times { |idx| yield(self[idx], idx) } and return self if block_given?
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
      my_each { |item| swap = false unless item }
    else
      my_each { |item| swap = false unless args === item }
      to_enum
    end
    swap
  end

  def my_any?(args = nil)
    swap = false
    if block_given?
      my_each { |item| swap = true if yield(item) }
    elsif args.nil?
      my_each { |item| swap = true if item }
    else
      my_each { |item| swap = true if args === item }
      to_enum
    end
    swap
  end

  def my_none?(args = nil)
    swap = true
    if block_given?
      my_each { |item| swap = false if yield(item) }
    elsif args.nil?
      my_each { |item| swap = false if item }
    else
      my_each { |item| swap = false if args === item }
      to_enum
    end
    swap
  end

  def my_count(args = nil)
    count = 0
    if block_given?
      my_each { |item| count += 1 if yield(item) }
    elsif args.nil?
      my_each { |item| count += 1 if item }
    else
      my_each { |item| count += 1 if args === item }
      to_enum
    end
    count
  end

  def my_inject(accumulator = nil, operator = nil)
    if !block_given? or operator.nil?
      if operator.nil?
        operator = accumulator
        accumulator = nil
      end
      operator = operator.to_sym
      my_each { |item| accumulator = accumulator.nil? ? item : accumulator.__send__(operator, item) }
    else
      each { |item| accumulator = accumulator.nil? ? self[item] : yield(accumulator, self[item]) }
    end
    accumulator
  end
end
