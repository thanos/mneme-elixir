defmodule Mneme.Pool do
  @moduledoc """
  Optional pool abstraction for controlled concurrency.

  In v0.1 this module is intentionally small and non-mandatory.
  """

  use GenServer

  alias Mneme.Collection

  @type t :: pid()

  @spec start_link(keyword()) :: GenServer.on_start()
  def start_link(opts), do: GenServer.start_link(__MODULE__, opts, name: Keyword.get(opts, :name))

  @spec search(t(), [number()], keyword()) ::
          {:ok, [Mneme.Result.t()]} | {:error, Mneme.Error.t()}
  def search(pool, query, opts \\ []), do: GenServer.call(pool, {:search, query, opts})

  @impl true
  def init(opts) do
    {:ok, %{collection: Keyword.fetch!(opts, :collection)}}
  end

  @impl true
  def handle_call({:search, query, opts}, _from, state) do
    {:reply, Collection.search(state.collection, query, opts), state}
  end
end
