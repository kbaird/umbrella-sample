defmodule SampleApp.Web.CalculationController do
  use SampleApp.Web, :controller

  alias SampleApp.Web.Math

  action_fallback SampleApp.Web.FallbackController

  def show(conn, %{"operand"   => operand,
                   "operation" => operation} = _params) do
    result = Math.calculate({operation, formatted_operand(operand)})
    send_resp(conn, 200, "#{result}")
  end

  ### PRIVATE FUNCTIONS

  defp formatted_operand(operand) do
    case String.match?(operand, ~r/\./) do
      true -> String.to_float(operand)
      _    -> String.to_integer(operand)
    end
  end

end
