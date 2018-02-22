defmodule Daze.Router do
  use Plug.Router

  if Mix.env() == :dev do
    use Plug.Debugger, style: [primary: "#c0392b", accent: "#41B577"]
  end

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "We have a router!")
  end
end
