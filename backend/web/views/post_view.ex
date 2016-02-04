defmodule EmberPhoenixGraphql.PostView do
  use EmberPhoenixGraphql.Web, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, EmberPhoenixGraphql.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, EmberPhoenixGraphql.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      title: post.title,
      content: post.content,
      author: post.author}
  end
end
