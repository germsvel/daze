defmodule DazeTest do
  use ExUnit.Case
  doctest Daze

  test "greets the world" do
    assert Daze.hello() == :world
  end
end
