defmodule SampleApp do
  @moduledoc """
  Documentation for SampleApp.
  """

  alias SampleApp.Worker

  def negate(operand), do: Worker.negate(operand)
  def square(operand), do: Worker.square(operand)

end
