defmodule ReturnToSender.Caller do
  def work({number, pool_number}) do
    ExTwilio.Call.create(
      twiml: "<Response><Say>Stop calling me you jack ass</Say><Record playBeep='false' /></Response>",
      from: pool_number,
      to: number
    )
    Process.sleep(20_000)
  end
end
