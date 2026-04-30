defmodule Mneme.Result do
  @moduledoc """
  Search result item.
  """

  @type t :: %__MODULE__{
          id: String.t(),
          score: float()
        }

  defstruct [:id, :score]
end
