
defmodule Sandbox do
    def factors(n) do
        for x <- 1 .. n, rem(n,x) == 0,do: x
    end
    
    def fizzBuzz(n) when rem(n,3) == 0 and rem(n,5) == 0, do: "FizzBuzz" 
    def fizzBuzz(n) when rem(n,3) == 0, do: "Fizz" 
    def fizzBuzz(n) when rem(n,5) == 0, do: "Buzz" 
    def fizzBuzz(n), do: n
    
    def fib(0), do: 0
    def fib(1), do: 1
    def fib(n), do: fib(n-1) + fib(n-2)
    
    
    def encode(list), do: _encode(list,[])
    defp _encode([a,a | tail],result), do: _encode([{a,2} | tail],result)
    defp _encode([{a,n}, a|tail], result), do: _encode([{a,n+1}|tail],result)
    defp _encode([a | tail],result), do: _encode(tail,[a|result])
    defp _encode([],result), do: Enum.reverse result
     
end


defmodule Example do
    def spawn ,do: spawn Example,:Listen,[]
    def listen do
        receive do
            {:ok , value} ->
            IO.puts "hogege?:#{value}"
            listen
        end
    end
end


