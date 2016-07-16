defmodule Zundoko do
  @zun "ズン "
  @doko "ドコ "
  @kiyoshi "キ・ヨ・シ！"
  def try(n) do
    zundoko |> kiyoshi |> Enum.take(n) |> IO.puts
    # zundoko |> kiyoshi |> Enum.chunk(2)
    
  end
  def zundoko do
    Stream.repeatedly(fn -> Enum.random([@zun, @doko]) end)
  end

  def kiyoshi(zundoko) do
    zundoko |> Stream.transform([], fn e, acc ->
      if Enum.count(acc) < 5 do
        {[e], [e|acc]}
      else
        [_ | tail] = Enum.reverse(acc)
        next_acc = Enum.reverse(tail)
        case Enum.reverse(acc) do
          [@zun,@zun,@zun,@zun,@doko] -> {[@kiyoshi,e],[e | next_acc]}
          _ -> {[e],[e | next_acc]}
        end
      end
    end)
  end
end
