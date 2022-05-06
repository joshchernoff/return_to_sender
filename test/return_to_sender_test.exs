defmodule ReturnToSenderTest do
  use ExUnit.Case
  doctest ReturnToSender

  test "greets the world" do
    assert ReturnToSender.hello() == :world
  end
end
