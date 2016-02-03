defmodule EmberPhoenixGraphql.PageController do
  use EmberPhoenixGraphql.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
