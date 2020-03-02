defmodule EventstoreDemo.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    libcluster_config = Application.get_all_env(:libcluster)

    children = [
      EventstoreDemo.EventStore,
      {Cluster.Supervisor, [libcluster_config, [name: EventstoreDemo.ClusterSupervisor]]}
    ]

    opts = [strategy: :one_for_one, name: EventstoreDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
