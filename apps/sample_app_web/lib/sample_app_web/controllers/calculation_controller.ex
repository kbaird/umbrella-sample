defmodule SampleApp.Web.CalculationController do
  use SampleApp.Web, :controller

  alias SampleApp.Web.Math

  action_fallback SampleApp.Web.FallbackController

  def show(conn, %{"operand"   => operand,
                   "operation" => operation} = _params) do
    result = Math.calculate({operation, String.to_float(operand)})
    send_resp(conn, 200, "#{result}")
  end

end
