# Project 2: Enumerable Methods
require 'byebug'
module Enumerable
  def my_each(&proc)
    if block_given?
      length.times { |i| proc.call(self[i]) }
      return self
    end
    to_enum
  end

  def my_each_with_index(&proc)
    if block_given?
      length.times { |item, _idx| proc.call(item) }
      return self
    end
    to_enum
  end

  def my_select(&proc)
    if block_given?
      selection = []
      length.times do |i|
        selection.push(self[i]) if proc.call(self[i])
      end
      return self
    end
    to_enum
  end

  def my_all?(&proc)
    switch = true
    if block_given?
      length.times do |i|
        switch = false if proc.call(self[i]) == false
      end
    end
    switch
  end

  # def my_any?(&proc)
  #   length.times do |i|
  #     return true if proc.call(self[i]) == true
  #   end
  # end

  # def my_none?(&proc)
  #   length.times do |i|
  #     return true if proc.call(self[i]) != true
  #   end
  # end

  def my_map(&proc)
    if block_given?
      mapped = []
      length.times do |i|
        mapped.push(proc.call(self[i]))
      end
      return mapped
    end
    to_enum
  end

  def my_inject(accumulator, operator = nil, &block)
    block ||= ->(acc, value) { acc.send(operator, value) }

    my_each do |value|
      accumulator = block.call(accumulator, value)
    end
    accumulator
  end

  # def multiply_els(*arr)
  #   my_inject { |x, y| x * y }
  # end
end
