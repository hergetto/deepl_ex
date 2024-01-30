defmodule DeeplEx do
  @moduledoc """
  Translate text using the DeepL api.
  """

  alias DeeplEx.Configuration
  alias DeeplEx.DeepL
  alias DeeplEx.LanguageValidator
  alias DeeplEx.OptionsValidator

  @doc """
  This function translates the given text from the given source language, to the given target language.
  It either returns `{:ok, translation}` or `{:error, error}`.

  See `DeeplEx.LanguageValidator` and `DeeplEx.OptionsValidator` for more information about the allowed values.

  ## Example with correct input


    ```elixir
    iex> DeeplEx.translate("Hoje vou comer.", :PT, :EN)
    {:ok, "Today I'm going to eat."}
    ```


  ## Example when using an incorrect language atom

    ```elixir
    iex> DeeplEx.translate("Hoje vou comer.", :ZZ, :EN)
    {:error, :invalid_language_specification}
    ```
    
  ## Example when using options

    ```elixir
    iex> DeeplEx.translate("Hello, how are you?", :EN, :PT_BR, %{formality: "less"})
    {:ok, "Olá, cara, como você está?"}
    ```
  """
  def translate(
        text,
        source_language,
        target_language,
        options \\ %{}
      )
      when is_atom(source_language) and is_atom(target_language) and is_binary(text) do
    with {:valid_source_language?, true} <-
           LanguageValidator.valid_source_language?(source_language),
         {:valid_target_language?, true} <-
           LanguageValidator.valid_target_language?(target_language),
         {:valid_options?, true} <-
           OptionsValidator.valid_options?(options),
         {:ok, api_key} = Configuration.api_key(),
         tier = Configuration.tier(api_key),
         client <- DeepL.client(api_key, tier),
         {:ok, %{body: %{"translations" => [%{"text" => translation}]}}} <-
           DeepL.translate(client, %{
             source_language: source_language,
             target_language: target_language,
             text: text,
             options: options
           }) do
      {:ok, translation}
    else
      {:ok, %{status: 400, body: %{"message" => message}}} ->
        {:error, message}

      error ->
        error_response(error)
    end
  end

  defp error_response({error, _})
       when error in [:valid_source_language?, :valid_target_language?],
       do: {:error, :invalid_language_specification}

  defp error_response({error, _})
       when error == :valid_options?,
       do: {:error, :invalid_options_specification}

  defp error_response(error), do: error
end
