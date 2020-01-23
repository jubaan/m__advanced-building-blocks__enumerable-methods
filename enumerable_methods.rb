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

  # def my_all?(&proc)
  #   length.times do |i|
  #     return false if proc.call(self[i]) == false
  #   end
  # end

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

  # def my_map(&proc)
  #   my_each do |i|
  #     self[i] = proc.call(self[i])
  #   end
  #   self
  # end

  # def my_inject(*arr)
  #   init = arr.size.positive?
  #   result = init ? arr[0] : self[0]
  #   drop(init ? 0 : 1).my_each do |item|
  #     result = proc.call(result, item)
  #   end
  #   result
  # end

  # def multiply_els(*arr)
  #   my_inject { |x, y| x * y }
  # end
end
