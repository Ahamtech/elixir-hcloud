defmodule HcloudTest do
  use ExUnit.Case
  doctest Hcloud

  test "greets the world" do
    assert Hcloud.hello() == :world
  end
end
