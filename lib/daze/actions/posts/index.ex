defmodule Daze.Actions.Posts.Index do
  use Daze.Action

  alias Daze.Views.Posts

  def call(conn, _opts) do
    posts = Daze.Repo.all()

    render(conn, Posts.index(posts: posts))
  end
end
