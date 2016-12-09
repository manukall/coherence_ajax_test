# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :coherence_ajax_test,
  ecto_repos: [CoherenceAjaxTest.Repo]

# Configures the endpoint
config :coherence_ajax_test, CoherenceAjaxTest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+GclU1GxXAw1mbln77JR0Osyi+OZQr+6WOP3y+roQ4R3rTEu1p/mhU9GbwsQFQ1E",
  render_errors: [view: CoherenceAjaxTest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CoherenceAjaxTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: CoherenceAjaxTest.User,
  repo: CoherenceAjaxTest.Repo,
  module: CoherenceAjaxTest,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:rememberable, :authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, CoherenceAjaxTest.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
