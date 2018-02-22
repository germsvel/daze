defmodule Daze.Actions.Posts.Index do
  import Plug.Conn
  require EEx

  def init(opts), do: opts

  EEx.function_from_file(:def, :index, "lib/daze/templates/posts/index.html.eex", [:assigns])

  def call(conn, _opts) do
    send_resp(conn, 200, index(adjective1: "coolest", adjective2: "fastest"))
  end
end
