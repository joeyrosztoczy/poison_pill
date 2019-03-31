defmodule PoisonPill.MixProject do
  use Mix.Project

  def project do
    [
      app: :poison_pill,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PoisonPill.Application, []}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.4.0"}
    ]
  end
end
