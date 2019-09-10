defmodule LilKube.Repo do
  use Ecto.Repo,
    otp_app: :lil_kube,
    adapter: Ecto.Adapters.Postgres
end
