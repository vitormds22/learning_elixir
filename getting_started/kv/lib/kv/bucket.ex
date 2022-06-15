defmodule KV.Bucket do
  use Agent, restart: :temporary

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  def put(agent, key, value) do
    Agent.update(agent, &Map.put(&1, key, value))
  end

  def get(agent, key) do
    Agent.get(agent, &Map.get(&1, key))
  end

  def delete(agent, key) do
    Process.sleep(1000)

    Agent.get_and_update(agent, fn dict ->
      Process.sleep(1000)
      Map.pop(dict, key)
    end)
  end
end
