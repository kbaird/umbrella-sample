defmodule SampleApp.Web.Math do
  @moduledoc """
  The boundary for the Math system.
  """

  @doc """
  calculate

  ## Examples

      iex> SampleApp.Web.Math.calculate({"negate", -3})
      3

      iex> SampleApp.Web.Math.calculate({"square", -3})
      9
  """
  def calculate({"negate", operand}), do: SampleApp.negate(operand)
  def calculate({"square", operand}), do: SampleApp.square(operand)

end
