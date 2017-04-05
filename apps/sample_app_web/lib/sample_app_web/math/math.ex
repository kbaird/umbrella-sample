defmodule SampleApp.Web.Math do
  @moduledoc """
  The boundary for the Math system.
  """

  @name {:global, SampleApp}

  @doc """
  calculate

  ## Examples

      iex> SampleApp.Web.Math.calculate({"negate", -3})
      3

      iex> SampleApp.Web.Math.calculate({"square", -3})
      9
  """
  def calculate({operation, operand}) do
    GenServer.call(@name, {operation, operand})
  end

end
