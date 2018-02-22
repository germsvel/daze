defmodule Daze.Router do
  use Plug.Router

  if Mix.env() == :dev do
    use Plug.Debugger, style: [primary: "#c0392b", accent: "#41B577"]
  end

  use Plug.ErrorHandler

  plug(Plug.Logger)
  plug(:match)
  plug(Plug.Parsers, parsers: [:urlencoded, :multipart])
  plug(:dispatch)

  get("/", to: Daze.Actions.Posts.Index)
  post("/posts", to: Daze.Actions.Posts.Create)

  def handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(conn.status, "<h2>We're terribly sorry. Something went wrong</h2>")
  end
end
