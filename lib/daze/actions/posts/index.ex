defmodule Daze.Actions.Posts.Index do
  import Plug.Conn
  alias Daze.Views.Posts

  def init(opts), do: opts

  def call(conn, _opts) do
    send_resp(conn, 200, Posts.index(adjective1: "coolest", adjective2: "fastest"))
  end
end
