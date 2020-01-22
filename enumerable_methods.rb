# Project 2: Enumerable Methods

module Enumerable
  def my_each(&proc)
    length.times do |i|
      proc.call(self[i])
    end
    self
  end

  def my_each_with_index(&proc)
    length.times do |item, i|
      proc.call(item)
    end
    self
  end
end
