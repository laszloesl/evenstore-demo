defmodule EventstoreDemo.EventStore do
  use EventStore, otp_app: :eventstore_demo

  def publish(stream, data) do
    event = %EventStore.EventData{
      event_type: "Elixir.EventstoreDemo.EventStore.Data",
      data: EventstoreDemo.EventStore.Data.from_map(data)
    }

    EventstoreDemo.EventStore.append_to_stream(stream, :any_version, [event])
  end
end
