defmodule Daze.Actions.Posts.Create do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    %{"post" => post, "author" => author} = conn.params

    Daze.Repo.insert(author, %{body: post, author: author})

    url = "/"

    conn
    |> put_resp_header("location", url)
    |> put_resp_content_type("text/html")
    |> send_resp(302, "You are being redirected to #{url}")
  end
end
