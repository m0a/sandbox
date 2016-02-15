defmodule SandboxTest do
  use ExUnit.Case
  doctest Sandbox

  test "the truth" do
    assert 1 + 1 == 2
  end
  
  test "my test" do
    
    assert Sandbox.factors(100) == [1, 2, 4, 5, 10, 20, 25, 50, 100]
  end
  
  
  test "fizz Buzz" do
    assert Sandbox.fizzBuzz(5) == "Buzz"
    assert Sandbox.fizzBuzz(3) == "Fizz"
    assert Sandbox.fizzBuzz(15) == "FizzBuzz"
  end
end
