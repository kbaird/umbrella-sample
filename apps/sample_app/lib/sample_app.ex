defmodule SampleApp do
  @moduledoc """
  Documentation for SampleApp.
  """

  use GenServer

  alias SampleApp.Worker

  @name {:global, SampleApp}

  @doc """
  negate

  ## Examples

      iex> SampleApp.start_link()
      iex> name = {:global, SampleApp}
      iex> GenServer.call(name, {"negate", -3})
      3
  """
  def handle_call({"negate", operand}, _from, state) do
    {:reply, negate(operand), state}
  end

  @doc """
  square

  ## Examples

      iex> SampleApp.start_link()
      iex> name = {:global, SampleApp}
      iex> GenServer.call(name, {"square", -3})
      9
  """
  def handle_call({"square", operand}, _from, state) do
    {:reply, square(operand), state}
  end

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: @name)
  end

  ### PRIVATE FUNCTIONS

  defp negate(operand), do: Worker.negate(operand)
  defp square(operand), do: Worker.square(operand)

end
