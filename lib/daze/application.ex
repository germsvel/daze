defmodule Daze.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Plug.Adapters.Cowboy, scheme: :http, plug: Daze.Router, options: [port: 4001]},
      {Daze.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: Daze.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
