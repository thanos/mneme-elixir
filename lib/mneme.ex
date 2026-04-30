defmodule Mneme do
  @moduledoc """
  Top-level API for the mneme Elixir client.
  """

  alias Mneme.Native

  @spec version() :: String.t()
  def version, do: "0.1.0"

  @spec abi_version() :: {:ok, non_neg_integer()} | {:error, Mneme.Error.t()}
  def abi_version, do: Native.abi_version()

  @spec native_available?() :: boolean()
  def native_available?, do: Native.available?()
end
