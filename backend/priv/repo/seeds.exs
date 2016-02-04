# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EmberPhoenixGraphql.Repo.insert!(%EmberPhoenixGraphql.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias EmberPhoenixGraphql.Post
alias EmberPhoenixGraphql.Repo

Faker.start()

for _ <- 1..10 do
  changeset = Post.changeset(%Post{}, %{title: Faker.Commerce.product_name, content: Faker.Lorem.sentence, author: Faker.Name.name})
  Repo.insert!(changeset)
end