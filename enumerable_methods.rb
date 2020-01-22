# Project 2: Enumerable Methods

module Enumerable

  public

  def my_each
    length.times do |i|
      yield(self[i])
    end
    self
  end

  # def my_each_with_index
  # end

  # def my_select
  # end

  # def my_all?
  # end

  # def my_any?
  # end

  # def my_none?
  # end

  # def my_count
  # end

  # def my_map
  # end

  # def my_inject
  # end

  # def multiply_els(arr)
  # end
end
