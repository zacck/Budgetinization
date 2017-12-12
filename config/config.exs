# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :spender,
  ecto_repos: [Spender.Repo]

# Configures the endpoint
config :spender, SpenderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kFSuszRy92cs3/GKGgteeXiWWuxXK9l0YNtp+7v6mPljA6dv8k0gg6XefhmghimW",
  render_errors: [view: SpenderWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Spender.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"