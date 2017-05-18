defmodule Negate.Worker do
  @moduledoc """
  Documentation for Negate.Worker.
  """
  require Logger
  use GenServer

  # API

  def negate(operand) do
    choose_worker_name() |> via_tuple()
                         |> GenServer.call({:negate, operand})
  end

  def square(operand) do
    choose_worker_name() |> via_tuple()
                         |> GenServer.call({:square, operand})
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, [], name: via_tuple(name))
  end

  # SERVER

  def init(messages), do: {:ok, messages}

  def handle_call({:negate, operand}, _from, state) do
    {:reply, _negate(operand), state}
  end

  def handle_call({:square, operand}, _from, state) do
    {:reply, _square(operand), state}
  end

  def handle_info(_msg, state), do: {:noreply, state}

  def terminate(_reason, _state), do: :ok

  def code_change(_old_vsn, _state, _extra) do
    {:error, :not_implemented}
  end

  ### MODULE-SPECIFIC FUNCTIONS

  ### PRIVATE FUNCTIONS

  defp _negate(operand), do: operand * -1
  defp _square(operand), do: operand * operand

  defp choose_worker_name do
    ### OPTIMIZE: something smarter than simple random
    Negate.Supervisor.worker_names |> Enum.random()
  end

  defp via_tuple(worker_name) do
    # :n for unique name
    # :l for local scope
    {:via, :gproc, {:n, :l, {:negate_worker, worker_name}}}
  end

end
