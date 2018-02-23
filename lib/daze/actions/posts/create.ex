defmodule Daze.Actions.Posts.Create do
  use Daze.Action

  def call(conn, _opts) do
    %{"post" => post, "author" => author} = conn.params

    Daze.Repo.insert(author, %{body: post, author: author})

    redirect(conn, to: "/")
  end
end
