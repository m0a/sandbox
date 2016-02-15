defmodule Study001 do
    
    def mapsum([],_func) ,do: 0
    def mapsum([head|tail],func),do: func.(head) + mapsum(tail,func)
    
    def max([head|tail]), do: _max(head,tail)
    defp _max(value,[]), do: value
    defp _max(value,[head|tail]) when value > head ,do: _max(value,tail)
    defp _max(_,[head|tail])  ,do: _max(head,tail)
     
end


defmodule Parse do 
     
    def calculate(num=[_|_]),do: _number(num,0)
    defp _number([],value),do: value
    defp _number([num|tail],value) when num in '0123456789' ,do: _number(tail,value * 10 + num - ?0)
    defp _number([?+|tail],value),do: value + number(tail)
    defp _number([?-|tail],value),do: value - number(tail)
    defp _number([?*|tail],value),do: value * number(tail)
    defp _number([?/|tail],value),do: value / number(tail)
    defp _number([_nonnum|_],_), do: raise 'parse error'
end