defmodule Newslettex.Repo do
  use Ecto.Repo,
    otp_app: :newslettex,
    adapter: Ecto.Adapters.Postgres
end
