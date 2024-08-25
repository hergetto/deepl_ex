# DeeplEx

DeeplEx is a package that allows the user to programmatically translate text using DeepL from their Elixir application.

## Installation

This package can be installed
by adding `deepl_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:deepl_ex, "~> 0.4.0"}
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

### Example

```elixir
iex> Application.put_env(:deepl_ex, :api_key, "your_deepl_api_key_here")
:ok
iex> DeeplEx.translate("Hoje vou comer.", :PT, :EN)
{:ok, "Today I'm going to eat."}
iex> DeeplEx.translate("Hoje vou comer.", :ZZ, :EN)
{:error, :invalid_language_specification}
iex> DeeplEx.translate("Hoje vou comer.", :DETECT, :EN)
{:ok, "Today I'm going to eat."}
```
