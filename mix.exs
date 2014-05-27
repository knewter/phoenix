Code.ensure_loaded?(Hex) and Hex.start

defmodule Phoenix.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phoenix,
      version: "0.2.4",
      elixir: "~> 0.13.3",
      deps: deps(Mix.env),
      package: [
        contributors: ["Chris McCord", "Darko Fabijan"],
        licenses: ["MIT"],
        links: [github: "https://github.com/phoenixframework/phoenix"]
      ],
      description: """
      Elixir Web Framework targeting full-featured, fault tolerant applications
      with realtime functionality
      """
    ]
  end

  def application do
    [
      mod: { Phoenix, [] },
      applications: [:cowboy, :plug]
    ]
  end

  defp deps(:prod) do
    [
      {:cowboy, github: "extend/cowboy", optional: true},
      {:plug, "0.4.3"},
      {:inflex, "0.2.0"},
      {:ex_conf, "0.1.1"},
      {:jazz, github: "meh/jazz"},
      {:calliope, github: "nurugger07/calliope"}
    ]
  end

  defp deps(_) do
    deps(:prod) ++
      [ {:ex_doc, github: "elixir-lang/ex_doc", only: [:docs]} ]
  end
end
