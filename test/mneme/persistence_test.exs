defmodule Mneme.PersistenceTest do
  use ExUnit.Case, async: true

  alias Mneme.Collection

  test "save returns native unavailable in phase 1 scaffold" do
    collection = %Collection{ref: make_ref(), name: "docs", dimension: 3, metric: :cosine}

    assert {:error, %Mneme.Error{code: :native_unavailable}} =
             Collection.save(collection, "docs.mneme")
  end
end
