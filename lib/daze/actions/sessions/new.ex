defmodule Daze.Actions.Sessions.New do
  use Daze.Action

  def call(conn, _) do
    render(conn, Daze.Views.Sessions.new([]))
  end
end
