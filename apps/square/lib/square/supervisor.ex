# lib/chat/supervisor.ex

defmodule Square.Supervisor do
  @moduledoc """
  Documentation for Square.Supervisor
  """
  use Supervisor

  alias Square.Worker

  @worker_count 20

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    workers() |> supervise(strategy: :one_for_one)
  end

  def worker_names do
    Enum.map((1..@worker_count), &("worker#{&1}"))
  end

  ### PRIVATE FUNCTIONS

  defp make_worker(name) do
    worker(Worker, [name], id: name)
  end

  defp workers do
    worker_names() |> Enum.map(&make_worker/1)
  end
end
