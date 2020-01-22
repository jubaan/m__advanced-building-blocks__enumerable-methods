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

  def my_select(&proc)
    selection = []
    length.times do |i|
      selection.push(self[i]) if proc.call(self[i])
    end
    selection
  end

  def my_all?(&proc)
    length.times do |i|
      return false if proc.call(self[i]) == false
    end
  end

  def my_any?(&proc)
    length.times do |i|
      return true if proc.call(self[i]) == true
    end
  end
end
