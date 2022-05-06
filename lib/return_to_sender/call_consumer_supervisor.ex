defmodule ReturnToSender.CallConsumerSupervisor do
  use ConsumerSupervisor
  require Logger
  alias ReturnToSender.{CallConsumer, CallProducer}

  def start_link(_args) do
    ConsumerSupervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    Logger.info("CallConsumerSupervisor init")

    children = [
      %{
        id: Consumer,
        start: {CallConsumer, :start_link, []},
        restart: :transient
      }
    ]

    opts = [
      strategy: :one_for_one,
      subscribe_to: [
        {CallProducer, max_demand: System.schedulers_online() * 2}
      ]
    ]

    ConsumerSupervisor.init(children, opts)
  end
end
