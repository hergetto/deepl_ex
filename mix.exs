defmodule DeeplEx.MixProject do
  use Mix.Project

  @version "0.3.0"
  @source_url "https://github.com/hergetto/deepl_ex"

  def project do
    [
      app: :deepl_ex,
      version: @version,
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
      test_coverage: test_coverage(),
      preferred_cli_env: preferred_cli_env(),

      # Docs
      name: "DeepL Ex",
      source_url: @source_url,
      homepage_url: @source_url,
      docs: docs(),

      # Hex.pm
      description: description(),
      package: package()
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
        threshold: 0
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

  # Specifies additional information for documentation.
  defp docs do
    [
      main: "DeeplEx",
      name: "DeepL Ex",
      source_ref: "v#{@version}",
      source_url: @source_url,
      canonical_url: ~c"https://hexdocs.pm/deepl_ex",
      extras: ["README.md", "LICENSE", "CHANGELOG.md"]
    ]
  end

  # Specifies the description for Hex.pm.
  defp description do
    """
    DeepL API wrapper for Elixir
    """
  end

  # Specifies the package information for Hex.pm.
  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @source_url
      },
      maintainers: ["hergetto", "joostdejager", "dustessavdh"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.2"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.32.2", only: :dev, runtime: false},
      {:mix_test_watch, "~> 1.1", only: :dev, runtime: false},
      {:excoveralls, "~> 0.18.0", only: :test, runtime: false},
      {:tesla, "~> 1.7"}
    ]
  end
end
