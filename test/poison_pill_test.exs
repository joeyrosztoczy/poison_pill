defmodule PoisonPillTest do
  use ExUnit.Case
  doctest PoisonPill

  test "greets the world" do
    assert PoisonPill.hello() == :world
  end
end
