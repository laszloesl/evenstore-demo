import Config

config :eventstore_demo, EventstoreDemo.EventStore,
  column_data_type: "jsonb",
  serializer: EventStore.JsonbSerializer,
  types: EventStore.PostgresTypes,
  registry: :distributed,
  username: "postgres",
  password: "postgres",
  database: "eventstore",
  hostname: "localhost"

config :eventstore_demo,
  event_stores: [EventstoreDemo.EventStore]

config :libcluster,
  epmd: [
    strategy: Cluster.Strategy.Epmd,
    config: [
      hosts: [
        :"es1@esl.localhost",
        :"es2@esl.localhost"
      ]
    ]
  ]
