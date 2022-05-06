defmodule ReturnToSender.CallConsumer do
  require Logger

  def start_link({number, pool} = event) do
    Logger.info("CallConsumer received #{pool} -> #{number}")
    Task.start_link(fn ->
      ReturnToSender.Caller.work(event)
    end)
  end
end
