defmodule Square do
  @moduledoc """
  Documentation for Square.
  """

  alias Square.Worker

  def negate(operand), do: Worker.negate(operand)
  def square(operand), do: Worker.square(operand)

end
