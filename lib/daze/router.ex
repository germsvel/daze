defmodule Daze.Router do
  use Plug.Router

  if Mix.env() == :dev do
    use Plug.Debugger, style: [primary: "#c0392b", accent: "#41B577"]
  end

  use Plug.ErrorHandler

  plug(Plug.Logger)
  plug(Plug.Static, from: :daze, at: "/", only: ["images", "css", "favicon.ico"])
  plug(:match)
  plug(:put_secret_key_base)
  plug(Plug.Parsers, parsers: [:urlencoded, :multipart])
  plug(Plug.Session, store: :cookie, key: "_daze_app", signing_salt: "daze salt")
  plug(:fetch_session)
  plug(:dispatch)

  get("/", to: Daze.Actions.Posts.Index)
  post("/posts", to: Daze.Actions.Posts.Create)
  get("/sign_in", to: Daze.Actions.Sessions.New)
  post("/sessions", to: Daze.Actions.Sessions.Create)

  def put_secret_key_base(conn, _) do
    put_in(
      conn.secret_key_base,
      "tosp2eJ0EVDXq/litnqe3iTMf4oGJuos0PbJk1NzkL4SaMEPB8OGu4T8Ym+WavGY"
    )
  end

  def handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(conn.status, "<h2>We're terribly sorry. Something went wrong</h2>")
  end
end
