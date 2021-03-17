# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Configure Mix tasks and generators
config :ecto_gen_error_reproduce,
  ecto_repos: [EctoGenErrorReproduce.Repo]

config :ecto_gen_error_reproduce_web,
  ecto_repos: [EctoGenErrorReproduce.Repo],
  generators: [context_app: :ecto_gen_error_reproduce]

# Configures the endpoint
config :ecto_gen_error_reproduce_web, EctoGenErrorReproduceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2VtQfPOvN0SYrhuaW1SovZLxzjfyZ5Hx4NnBx5dLaNpxskFObmgbWngeN6y6eeQF",
  render_errors: [view: EctoGenErrorReproduceWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: EctoGenErrorReproduce.PubSub,
  live_view: [signing_salt: "Rdj7L9T/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ecto_gen,
  otp_app: :ecto_gen_error_reproduce,
  db_config: EctoGenErrorReproduce.Repo,
  output_location: "apps/ecto_gen_error_reproduce/lib/database", # relative path should be relative to the project root
  output_module: "EctoGenErrorReproduce.Database", # Module prefix that will be used for generated content

  # This way, you can provide custom template for individual parts of generation
  # default files are in /priv/templates directory of this package
  # template_overrides: [
  #   db_module: "/path/to/db_module.ex.eex",
  #   routine: "/path/to/db_routine.ex.eex",
  #   routine_result: "/path/to/db_routine_result.ex.eex",
  #   routine_parser: "/path/to/db_routine_parser.ex.eex"
  # ],

  # This config holds information about what routines (funcs) from database will have generated elixir functions etc.
  # db project has keys, each representing database's schema which has config for what routines it includes/ingores
  db_project: [
    public: [
      funcs: "*", # or ["func_name_1", "func_name_2"]

      # makes sense to specify ignored functions (routines) only when funcs equal "*"
      ignored_funcs: []
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
import_config "config.local.exs"
