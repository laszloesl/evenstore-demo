defmodule EventstoreDemo.EventStore.Data do
  defstruct [
    :tag,
    source: "default"
  ]

  def from_map(fields) do
    struct!(__MODULE__, fields)
  end
end
