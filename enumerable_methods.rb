# Project 2: Enumerable Methods

module Enumerable
  def my_each(&block)
    arr.length.times do |count|
      puts yield(arr[count])
    end
    arr
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
