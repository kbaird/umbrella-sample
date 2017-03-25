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
  def handle_call({"negate", int}, _from, state) do
    {:reply, negate(int), state}
  end

  @doc """
  square

  ## Examples

      iex> SampleApp.start_link()
      iex> name = {:global, SampleApp}
      iex> GenServer.call(name, {"square", -3})
      9
  """
  def handle_call({"square", int}, _from, state) do
    {:reply, square(int), state}
  end

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: @name)
  end

  ### PRIVATE FUNCTIONS

  defp negate(int), do: Worker.negate(int)
  defp square(int), do: Worker.square(int)

end
