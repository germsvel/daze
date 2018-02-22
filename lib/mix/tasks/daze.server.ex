defmodule Mix.Tasks.Daze.Server do
  use Mix.Task
  require Logger

  def run(args) do
    Logger.info("Starting Daze Server")
    Mix.Tasks.Run.run(args ++ ["--no-halt"])
  end
end
