defmodule Square.Application do
  @moduledoc """
  Documentation for Square.Application
  """
  use Application

  alias Square.Supervisor

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Supervisor.start_link()
  end

end
