defmodule Mneme.PoolTest do
  use ExUnit.Case, async: true

  alias Mneme.{Collection, Pool}

  test "pool starts and delegates search" do
    collection = %Collection{ref: make_ref(), name: "docs", dimension: 3, metric: :cosine}
    {:ok, pool} = Pool.start_link(collection: collection)

    assert {:error, %Mneme.Error{code: :native_unavailable}} =
             Pool.search(pool, [1.0, 0.0, 0.0], limit: 1)
  end
end
