defmodule DeeplExTest do
  use ExUnit.Case
  doctest DeeplEx

  test "greets the world" do
    assert DeeplEx.hello() == :world
  end
end
