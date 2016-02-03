ExUnit.start

Mix.Task.run "ecto.create", ~w(-r EmberPhoenixGraphql.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r EmberPhoenixGraphql.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(EmberPhoenixGraphql.Repo)

