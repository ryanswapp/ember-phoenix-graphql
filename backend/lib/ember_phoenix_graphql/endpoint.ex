defmodule EmberPhoenixGraphql.Endpoint do
  use Phoenix.Endpoint, otp_app: :ember_phoenix_graphql

  socket "/socket", EmberPhoenixGraphql.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :ember_phoenix_graphql, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_ember_phoenix_graphql_key",
    signing_salt: "Z9MQxCT3"

  cors_host =
    case Mix.env do
      :prod -> "https://###FILL-IN###.herokuapp.com"
      _ -> "http://localhost:4200"
    end

  plug CORSPlug, [origin: cors_host]
  plug EmberPhoenixGraphql.Router
end
