defmodule PoisonPill.Worker do
  use GenServer

  @time_until_sync 24 * 60 * 60 * 1000

  # Client API
  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  # Server API
  def init(state) do
    schedule_api_sync(:now)
    {:ok, state}
  end

  def handle_info(:sync_api, state) do
    new_state = HTTPoison.get!("http://localhost:1")
    schedule_api_sync(:later, @time_until_sync)

    {:noreply, new_state}
  end

  defp schedule_api_sync(description, time_until_sync \\ 0)
  defp schedule_api_sync(:now, _), do: Process.send(self(), :sync_api, [])

  defp schedule_api_sync(:later, time_until_sync) do
    Process.send_after(self(), :sync_api, time_until_sync)
  end
end
