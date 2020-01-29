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

  def my_none?(args = nil, &block)
    swap = false
    if block
      my_each { |item| swap = true unless block.call(item) }
    elsif args.nil?
      my_each { |item| swap = true unless item }
    else
      my_each { |item| swap = true unless args === item }
      to_enum
    end
    swap
  end

  def my_count(args = nilm, &block)
    count = 0
    if block_given?
      my_each { |item| count += 1 if block.call(item) }
    elsif args.nil?
      my_each { |item| count += 1 if self[item] }
    else
      size.times { |item| count += 1 if args === self[item] }
      to_enum
    end
    swap
  end

  def my_inject(accumulator = nil, operator = nil, &block)
    if !block or operator.nil?
      if operator.nil?
        operator = accumulator
        accumulator = nil
      end

      operator = operator.to_sym

      my_each do |item|
        accumulator = if accumulator.nil?
                        item
                      else
                        accumulator.__send__(operator, item)
                      end
      end

    else
      each do |item|
        accumulator = if accumulator.nil?
                        item
                      else
                        block.call(accumulator, item)
                      end
      end
    end

    accumulator
  end
end
