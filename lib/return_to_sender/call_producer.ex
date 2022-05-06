defmodule ReturnToSender.CallProducer do
  use GenStage
  require Logger

  def start_link(_args) do
    initial_state = []
    GenStage.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

  def init(initial_state) do
    Logger.info("CallProducer init")
    {:producer, initial_state}
  end

  def handle_demand(demand, state) do
    Logger.info("CallProducer received demand for #{demand} call")
    events = []
    {:noreply, events, state}
  end

  def call_numbers(numbers) when is_list(numbers) do
    GenStage.cast(__MODULE__, {:numbers, numbers})
  end

  def handle_cast({:numbers, numbers}, state) do
    {:noreply, numbers, state}
  end
end
