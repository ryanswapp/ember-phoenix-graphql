defmodule EmberPhoenixGraphql.Post do
  use EmberPhoenixGraphql.Web, :model

  schema "posts" do
    field :title, :string
    field :content, :string
    field :author, :string

    timestamps
  end

  @required_fields ~w(title content author)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
