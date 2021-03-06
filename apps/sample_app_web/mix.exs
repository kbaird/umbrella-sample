defmodule SampleApp.Web.Mixfile do
  use Mix.Project

  def project do
    [app:             :sample_app_web,
     version:         "0.0.1",
     build_path:      "../../_build",
     config_path:     "../../config/config.exs",
     deps_path:       "../../deps",
     lockfile:        "../../mix.lock",
     elixir:          "~> 1.4",
     elixirc_paths:   elixirc_paths(Mix.env),
     compilers:       [:phoenix, :gettext] ++ Mix.compilers,
     start_permanent: Mix.env == :prod,
     aliases:         aliases(),
     deps:            deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {SampleApp.Web.Application, []},
     extra_applications: [:logger, :runtime_tools]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ~w[lib test/support]
  defp elixirc_paths(_),     do: ~w[lib]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:cowboy,               "~> 1.0"},
      {:sample_app,           in_umbrella: true}, 
      {:gettext,              "~> 0.11"}, 
      {:phoenix,              "~> 1.3.0-rc.1"},
      {:phoenix_ecto,         "~> 3.2"},
      {:phoenix_html,         "~> 2.6"},
      #{:phoenix_live_reload,  "~> 1.0", only: :dev},
      {:phoenix_pubsub,       "~> 1.0"},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, we extend the test task to create and migrate the database.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
