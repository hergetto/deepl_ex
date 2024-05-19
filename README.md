# DeeplEx

DeeplEx is a package that allows the user to programmatically translate text using DeepL from their Elixir application.

## Installation

This package can be installed
by adding `deepl_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:deepl_ex, "~> 0.3.0"}
  ]
end
```

The docs can be found at <https://hexdocs.pm/deepl_ex>.

## Configuration

After installing the package, the following should be added to your config.

```elixir
config :deepl_ex,
  api_key: "" # String containing your DeepL api key
```

We determine the tier based on the api key, so you don't need to specify the tier.
