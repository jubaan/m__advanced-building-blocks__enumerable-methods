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

  def my_inject(acc, operator = nil, &block)
    if operator.nil? && block.nil?
      operator = acc
      acc = nil
    end

    block = case operator
            when Symbol
              ->(a, value) { a.send(operator, value) }
            when nil
              block
    end
    if acc.nil?
      ignore_first = true
      acc = first
    end
    index = 0
    my_each do |item|
      acc = block.call(acc, item) unless ignore_first && index.zero?
      index += 1
    end
    acc
  end
end
