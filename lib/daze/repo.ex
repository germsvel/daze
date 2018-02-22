defmodule Daze.Repo do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> Map.new() end, name: __MODULE__)
  end

  def insert(key, value) do
    Agent.update(__MODULE__, fn map ->
      data =
        case Map.get(map, key) do
          nil -> []
          values -> values
        end

      Map.put(map, key, [value | data])
    end)
  end

  def all do
    Agent.get(__MODULE__, fn map ->
      map
      |> Map.values()
      |> Enum.concat()
    end)
  end
end
