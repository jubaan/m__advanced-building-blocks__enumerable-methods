# Project 2: Enumerable Methods

module Enumerable
  def my_each(&proc)
    length.times do |i|
      proc.call(self[i])
    end
    self
  end
end
