defmodule PostSchema do
  alias EmberPhoenixGraphql.Post 
  alias EmberPhoenixGraphql.Repo
  alias GraphQL.Schema
  alias GraphQL.Type.ObjectType
  alias GraphQL.Type.List
  alias GraphQL.Type.NonNull
  alias GraphQL.Type.ID
  alias GraphQL.Type.String
  alias GraphQL.Type.Int
  alias GraphQL.Type.Boolean

  def schema do 
    post = %ObjectType{
      name: "Post",
      description: "A post from the blog yo",
      fields: %{
        id: %{type: %Int{}},
        title: %{type: %String{}},
        content: %{type: %String{}},
        author: %{type: %String{}}
      }
    }

    %Schema{
      query: %ObjectType{
        name: "Query",
        fields: %{
          greeting: %{
            type: %String{},
            resolve: {PostSchema, :greeting}
          },
          posts: %{
            type: %List{ofType: post},
            resolve: {PostSchema, :posts}
          }
        }
      }
    }
  end

  def greeting(_, _, _), do: "Hello, world!"
  def posts(_, _, _) do
    posts = Repo.all(Post)
    posts_map = Phoenix.View.render(EmberPhoenixGraphql.PostView, "index.json", posts: posts)
    Map.get(posts_map, :data)
  end
end