require './enumerable_methods_yield.rb'

obj = Object.new

def obj.each_arg(a, b=:b, *rest)
  yield a
  yield b
  yield rest
  :method_returned
end


RSpec.describe 'Enumerable' do
  let(:enum) { obj.to_enum :each_arg, :a, :x }

    describe '.my_each' do
      it 'with block' do
        expect(enum.my_each.to_a).to eql([:a, :x, []])
      end

      it 'no block and no arguments given' do
        expect(enum.my_each.equal?(enum)).to eql(true)
      end

      # it 'block given' do
      #   expect(enum.my_each { |elm| elm }).to eql(:method_returned)
      # end


      # it 'without block'
      # it 'with args'
      # it 'without args'
    end

    describe '.my_each_with' do

    end

    describe '.my_select' do

    end

    describe '.my_map' do

    end

    describe '.my_all?' do

    end

    describe '.my_any?' do

    end

    describe '.my_none?' do

    end

    describe '.my_count' do

    end

    describe '.my_inject' do

    end
end