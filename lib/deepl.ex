defmodule DeeplEx.DeepL do
  @moduledoc false
  use Tesla

  def translate(client, %{
        source_language: source_language,
        target_language: target_language,
        text: text,
        options: options
      }) do
    content =
      Map.merge(options, %{
        text: [
          text
        ],
        source_lang: parse_language(source_language),
        target_lang: parse_language(target_language)
      })

    Tesla.post(client, "/translate", content)
  end

  def client(api_key, tier) do
    api_key
    |> middleware(tier)
    |> Tesla.client()
  end

  defp middleware(api_key, tier) do
    [
      {Tesla.Middleware.BaseUrl, base_url(tier)},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers, [{"authorization", "DeepL-Auth-Key #{api_key}"}]}
    ]
  end

  defp base_url(:pro) do
    "https://api.deepl.com/v2"
  end

  defp base_url(_) do
    "https://api-free.deepl.com/v2"
  end

  defp parse_language(language) do
    language
    |> Atom.to_string()
    |> String.replace("_", "-")
  end
end
