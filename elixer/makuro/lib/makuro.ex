defmodule Makuro do
  
  defmacro __using__(_) do
    quote do
      import Makuro
    end
  end
  defmacro twice(do: content) do
    quote do
      unquote(content)
      unquote(content)
    end
  end
end
