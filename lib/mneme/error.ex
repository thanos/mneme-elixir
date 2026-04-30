defmodule Mneme.Error do
  @moduledoc """
  Normalized error type for all `mneme` operations.
  """

  defexception [:code, :message]

  @type code ::
          :invalid_argument
          | :out_of_memory
          | :dimension_mismatch
          | :io
          | :index_not_built
          | :index_stale
          | :internal
          | :native_unavailable

  @type t :: %__MODULE__{code: code(), message: String.t()}

  @spec new(code(), String.t()) :: t()
  def new(code, message), do: %__MODULE__{code: code, message: message}
end
