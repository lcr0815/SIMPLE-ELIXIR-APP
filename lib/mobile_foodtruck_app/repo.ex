defmodule MobileFoodtruckApp.Repo do
  use Ecto.Repo,
    otp_app: :mobile_foodtruck_app,
    adapter: Ecto.Adapters.Postgres
end
