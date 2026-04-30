defmodule MnemeTest do
  use ExUnit.Case, async: true

  test "version/0 works" do
    assert Mneme.version() == "0.1.0"
  end

  test "native_available?/0 works" do
    assert Mneme.native_available?()
  end
end
