defmodule DeeplEx do
  @moduledoc """
  Translate text using the DeepL api.
  """

  alias DeeplEx.Configuration
  alias DeeplEx.DeepL
  alias DeeplEx.LanguageValidator

  @doc """
  This function translates the given text from the given source language, to the given target language.

  ## Example with correct input


    ```elixir
    iex> DeeplEx.translate("Hoje vou comer.", :PT, :EN)
    "Today I'm going to eat."
    ```


  ## Example when using an incorrect language atom

    ```elixir
    iex> DeeplEx.translate("Hoje vou comer.", :ZZ, :EN)
    {:error, :invalid_language_specification}
    ```
  """
  def translate(
        text,
        source_language,
        target_language
      )
      when is_atom(source_language) and is_atom(target_language) and is_binary(text) do
    with {:valid_source_language?, true} <-
           LanguageValidator.valid_source_language?(source_language),
         {:valid_target_language?, true} <-
           LanguageValidator.valid_target_language?(target_language),
         {:ok, api_key} = Configuration.api_key(),
         {:ok, tier} = Configuration.tier(),
         client <- DeepL.client(api_key, tier),
         {:ok, %{body: %{"translations" => [%{"text" => translation}]}}} <-
           DeepL.translate(client, %{
             source_language: source_language,
             target_language: target_language,
             text: text
           }) do
      translation
    else
      error ->
        error_response(error)
    end
  end

  defp error_response({error, _}) when error in [:valid_source_language?, :valid_target_language],
    do: {:error, :invalid_language_specification}

  defp error_response(error), do: error
end
