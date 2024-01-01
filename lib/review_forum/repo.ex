defmodule ReviewForum.Repo do
  use Ecto.Repo,
    otp_app: :review_forum,
    adapter: Ecto.Adapters.SQLite3
end
