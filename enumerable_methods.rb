# Project 2: Enumerable Methods
module Enumerable
  def my_each(&block)
    length.times { |i| block.call(self[i]) } if block_given?
    to_enum
  end

  def my_each_with_index(&block)
    my_each { |item| block.call(item) } if block_given?
    to_enum
  end

  def my_select(&block)
    to_enum unless block_given?
    selection = []
    my_each { |item| selection << item if block.call(item) }
    selection
  end
end
