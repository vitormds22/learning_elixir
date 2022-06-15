defmodule RunAfter do
  import MyError
  def without_even_trying do
    raise MyError
  after
    IO.puts "cleaning up!"
  end
end
