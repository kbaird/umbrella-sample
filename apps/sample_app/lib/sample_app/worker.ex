defmodule SampleApp.Worker do
  @moduledoc """
  Documentation for SampleApp.Worker.
  """
  require Logger
  use GenServer

  # API

  def negate(int) do
    choose_worker_name() |> via_tuple()
                         |> GenServer.call({:negate, int})
  end

  def square(int) do
    choose_worker_name() |> via_tuple()
                         |> GenServer.call({:square, int})
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, [], name: via_tuple(name))
  end

  # SERVER

  def init(messages), do: {:ok, messages}

  def handle_call({:negate, int}, _from, state) do
    {:reply, _negate(int), state}
  end

  def handle_call({:square, int}, _from, state) do
    {:reply, _square(int), state}
  end

  def handle_info(_msg, state), do: {:noreply, state}

  def terminate(_reason, _state), do: :ok

  def code_change(_old_vsn, _state, _extra) do
    {:error, :not_implemented}
  end

  ### MODULE-SPECIFIC FUNCTIONS

  ### PRIVATE FUNCTIONS

  defp _negate(int), do: int * -1
  defp _square(int), do: int * int

  defp choose_worker_name do
    ### OPTIMIZE: something smarter than simple random
    SampleApp.Supervisor.worker_names |> Enum.random()
  end

  defp via_tuple(worker_name) do
    # :n for unique name
    # :l for local scope
    {:via, :gproc, {:n, :l, {:sample_app_worker, worker_name}}}
  end

end
