defmodule ReviewForum.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :views, :integer
      add :author, :string

      timestamps(type: :utc_datetime)
    end
  end
end
