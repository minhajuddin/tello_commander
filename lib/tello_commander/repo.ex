defmodule TC.Repo do
  use Ecto.Repo,
    otp_app: :tello_commander,
    adapter: Ecto.Adapters.Postgres
end
