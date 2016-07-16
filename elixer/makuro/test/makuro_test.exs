defmodule MakuroTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Makuro
  use Makuro

  test "twice" do
    output = capture_io fn ->
      twice do: IO.puts("age")
    end
    assert output == "age\nage\n"
  end
end
