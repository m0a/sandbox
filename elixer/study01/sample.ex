defmodule Sample do
    def what(%{banana: x}) do
        IO.puts "banana cout:#{x}"
    end 
    def what(%{bana: x}), do: IO.puts "bana c: #{x}" 
end
