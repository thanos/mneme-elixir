defmodule Mneme.NativeTest do
  use ExUnit.Case, async: true

  test "abi_version is available through embedded core NIF" do
    assert {:ok, 1} = Mneme.abi_version()
  end
end
