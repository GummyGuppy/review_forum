defmodule ReviewForum.ForumTest do
  use ReviewForum.DataCase

  alias ReviewForum.Forum

  describe "articles" do
    alias ReviewForum.Forum.Article

    import ReviewForum.ForumFixtures

    @invalid_attrs %{title: nil, author: nil, views: nil}

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Forum.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Forum.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      valid_attrs = %{title: "some title", author: "some author", views: 42}

      assert {:ok, %Article{} = article} = Forum.create_article(valid_attrs)
      assert article.title == "some title"
      assert article.author == "some author"
      assert article.views == 42
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forum.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      update_attrs = %{title: "some updated title", author: "some updated author", views: 43}

      assert {:ok, %Article{} = article} = Forum.update_article(article, update_attrs)
      assert article.title == "some updated title"
      assert article.author == "some updated author"
      assert article.views == 43
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Forum.update_article(article, @invalid_attrs)
      assert article == Forum.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Forum.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Forum.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Forum.change_article(article)
    end
  end
end
