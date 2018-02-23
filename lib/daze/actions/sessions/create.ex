defmodule Daze.Actions.Sessions.Create do
  use Daze.Action

  def call(conn, _) do
    %{"email" => email} = conn.params

    conn
    |> put_session(:current_user_email, email)
    |> redirect(to: "/")
  end
end

