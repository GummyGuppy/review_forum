defmodule ReviewForum.ForumFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ReviewForum.Forum` context.
  """

  @doc """
  Generate a article.
  """
  def article_fixture(attrs \\ %{}) do
    {:ok, article} =
      attrs
      |> Enum.into(%{
        author: "some author",
        title: "some title",
        views: 42
      })
      |> ReviewForum.Forum.create_article()

    article
  end
end
