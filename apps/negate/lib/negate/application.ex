defmodule Negate.Application do
  @moduledoc """
  Documentation for Negate.Application
  """
  use Application

  alias Negate.Supervisor

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Supervisor.start_link()
  end

end
