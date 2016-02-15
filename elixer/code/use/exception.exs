#---
# Excerpted from "Programming Elixir 1.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir12 for more book information.
#---
defmodule MyException do
  @behaviour Exception

  defstruct message: ""

  def exception(msg),     do: %MyException{message: "BOOM: #{msg}"}
  def message(exception), do: "#{exception.message}!!!"
end

try do
# raise MyException, "this is only a test"
rescue
  error ->
    IO.inspect error
    IO.puts error.message()
end
