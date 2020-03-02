defmodule EventstoreDemo.EventStore.Subscriber do
  use GenServer

  def init(opts) do
    stream = opts[:stream]
    send(self(), {:subscribe, stream})
    {:ok, %{}}
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def handle_info({:subscribe, stream}, _state) do
    {:ok, subscription} =
      EventstoreDemo.EventStore.subscribe_to_stream(
        stream,
        "subscriber",
        self()
      )

    {:noreply, %{subscription: subscription}}
  end

  def handle_info({:subscribed, subscription}, state) do
    IO.inspect(subscription, label: "Subscribed")
    {:noreply, state}
  end

  def handle_info({:events, events}, %{subscription: subscription} = state) do
    IO.inspect(events, label: "Events")
    EventstoreDemo.EventStore.ack(subscription, events)
    {:noreply, state}
  end
end
