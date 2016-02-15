defmodule Chop do

    def guess(actual,_..actual) do
        IO.puts "#{actual}"
    end
    def guess(actual,min..max) when div(max+min,2) >= actual do
        max = div(max+min,2)
        IO.puts "Is it #{max}"
        guess(actual,min..max)
    end    
    def guess(actual,min..max) when div(max+min,2) < actual do
        min = div(max+min,2)
        IO.puts "Is it #{min}"
        guess(actual,min..max)
    end
end