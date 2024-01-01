defmodule ReviewForumWeb.ArticleController do
  use ReviewForumWeb, :controller

  alias ReviewForum.Forum
  alias ReviewForum.Forum.Article

  def index(conn, _params) do
    articles = Forum.list_articles()
    render(conn, :index, articles: articles)
  end

  def new(conn, _params) do
    changeset = Forum.change_article(%Article{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"article" => article_params}) do
    case Forum.create_article(article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article created successfully.")
        |> redirect(to: ~p"/articles/#{article}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    article =
     Forum.get_article!(id)
    |> Forum.inc_article_views()
    render(conn, :show, article: article)
  end

  def edit(conn, %{"id" => id}) do
    article = Forum.get_article!(id)
    changeset = Forum.change_article(article)
    render(conn, :edit, article: article, changeset: changeset)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Forum.get_article!(id)

    case Forum.update_article(article, article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article updated successfully.")
        |> redirect(to: ~p"/articles/#{article}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, article: article, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Forum.get_article!(id)
    {:ok, _article} = Forum.delete_article(article)

    conn
    |> put_flash(:info, "Article deleted successfully.")
    |> redirect(to: ~p"/articles")
  end




end
