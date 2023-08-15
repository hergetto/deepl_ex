defmodule DeeplEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :deepl_ex,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
      test_coverage: test_coverage(),
      preferred_cli_env: preferred_cli_env(),

      # Docs
      name: "DeepL Ex",
      source_url: "https://github.com/hergetto/deepl_ex",
      homepage_url: "https://github.com/hergetto/deepl_ex",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  #  Specifies the configuration for dialyzer.
  defp dialyzer do
    [
      plt_file: {:no_warn, "priv/plts/project.plt"},
      plt_core_path: "priv/plts/core.plt"
    ]
  end

  # Specifies the configuration for testing.
  defp test_coverage do
    [
      tool: ExCoveralls,
      output: "cover",
      summary: [
        threshold: 90
      ],
      export: "default"
    ]
  end

  defp preferred_cli_env do
    [
      coveralls: :test,
      "coveralls.html": :test,
      "coveralls.detail": :test,
      "coveralls.post": :test
    ]
  end

  defp docs do
    [
      main: "DeeplEx",
      extras: ["README.md"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.2"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.30.5", only: :dev, runtime: false},
      {:mix_test_watch, "~> 1.1", only: :dev, runtime: false},
      {:excoveralls, "~> 0.17.0", only: :test, runtime: false}
    ]
  end
end
