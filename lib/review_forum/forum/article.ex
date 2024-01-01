defmodule ReviewForum.Forum.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :title, :string
    field :author, :string
    field :views, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :views, :author])
    |> validate_required([:title, :views, :author])
  end
end
