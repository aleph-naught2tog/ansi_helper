defmodule AnsiHelperTest do
  use ExUnit.Case
  doctest AnsiHelper

  test "greets the world" do
    assert AnsiHelper.hello() == :world
  end
end
