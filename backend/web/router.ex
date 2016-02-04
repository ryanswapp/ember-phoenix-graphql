defmodule EmberPhoenixGraphql.Router do
  use EmberPhoenixGraphql.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EmberPhoenixGraphql do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api" do
    pipe_through :api

    forward "/post", GraphQL.Plug, schema: {PostSchema, :schema}
    # forward "/post", EmberPhoenixGraphql.PostController, :index
    resources "/posts", EmberPhoenixGraphql.PostController, except: [:new, :edit]
  end
end
