defmodule ReviewForumWeb.ArticleHTML do
  use ReviewForumWeb, :html

  embed_templates "article_html/*"

  @doc """
  Renders a article form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def article_form(assigns)
end
