defmodule Negate do
  @moduledoc """
  Documentation for Negate.
  """

  alias Negate.Worker

  def negate(operand), do: Worker.negate(operand)
  def square(operand), do: Worker.square(operand)

end
