# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lil_kube,
  ecto_repos: [LilKube.Repo]

config :lil_kube, LilKube.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool_size: 10

# Configures the endpoint
config :lil_kube, LilKubeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1qhna7sOouSyC7GligBA+ou+Maf6YqUtpSXN8YQdpwO9EP9l8f38+XuLtkU2cWnF",
  render_errors: [view: LilKubeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LilKube.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
