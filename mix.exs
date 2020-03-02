defmodule EventstoreDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :eventstore_demo,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {EventstoreDemo.Application, []}
    ]
  end

  defp deps do
    [
      {:eventstore, "~> 1.0"},
      {:jason, "~> 1.1"},
      {:libcluster, "~> 3.2"},
      {:elixir_uuid, "~> 1.2"}
    ]
  end

  defp aliases do
    [
      "event_store.reset": [
        "event_store.drop",
        "event_store.create",
        "event_store.init"
      ]
    ]
  end
end
