defmodule Daze.Action do
  defmacro __using__(_) do
    quote do
      import Plug.Conn
      import Daze.Action.Helpers

      def init(opts), do: opts
    end
  end

  defmodule Helpers do
    import Plug.Conn

    def render(conn, value) do
      conn
      |> put_resp_content_type("text/html")
      |> send_resp(200, value)
    end

    def redirect(conn, to: url) do
      conn
      |> put_resp_header("location", url)
      |> put_resp_content_type("text/html")
      |> send_resp(302, "You are being redirected to #{url}")
    end
  end
end
