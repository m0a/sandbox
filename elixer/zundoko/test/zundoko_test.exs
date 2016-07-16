defmodule ZundokoTest do
  #use ExUnit.Case
  use PowerAssert
  
  doctest Zundoko

  test "the truth" do
    assert 1 + 1 == 3
  end
  
  test "Stream transform test1" do
    stream = Stream.transform(1 .. 100, [], fn e, acc ->
      if Enum.count(acc) < 5 do
        {[e], [e | acc]}
      else
        {acc,[]}
      end
      
    end)
    
    assert stream |> Enum.take(20) == [1,2,3,4,5]
  end
  
  @zun "ズン"
  @doko "ドコ"
  @kiyoshi "キヨシ!"
  
  def zundoko do
    Stream.repeatedly(fn -> Enum.random([@zun, @doko]) end)
  end
  
  def kiyoshi(zundoko) do
    zundoko |> Stream.transform([], fn e, acc ->
      if Enum.count(acc) < 5 do
        {[e], [e|acc]}
      else 
        [head | tail] = Enum.reverse(acc)
        next_acc = Enum.reverse(tail)
        case Enum.reverse(acc) do
          [@zun,@zun,@zun,@zun,@doko] -> {[e,@kiyoshi],[e | next_acc]}
          _ -> {[e],[e | next_acc]}
        end
      end        
    end)
  end
  
  test "zundoko use Stream " do
    assert zundoko |> kiyoshi |> Enum.take(50)  == []
  end

end
