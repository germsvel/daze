defmodule Daze.Actions.Posts.Index do
  import Plug.Conn
  alias Daze.Views.Posts

  def init(opts), do: opts

  def call(conn, _opts) do
    posts = Daze.Repo.all()

    send_resp(conn, 200, Posts.index(posts: posts))
  end
end
