defmodule EctoGenErrorReproduce.Repo do
  use Ecto.Repo,
    otp_app: :ecto_gen_error_reproduce,
    adapter: Ecto.Adapters.Postgres
end
