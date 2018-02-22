defmodule Daze.Actions.Posts.Index do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    send_resp(conn, 200, "Plugs all the way down!")
  end
end
