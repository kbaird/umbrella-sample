defmodule SampleApp.Web.CalculationController do
  use SampleApp.Web, :controller

  alias SampleApp.Web.Math

  action_fallback SampleApp.Web.FallbackController

  def show(conn, %{"input"     => input,
                   "operation" => operation} = _params) do
    result = Math.calculate({operation, String.to_integer(input)})
    send_resp(conn, 200, "#{result}")
  end

end
