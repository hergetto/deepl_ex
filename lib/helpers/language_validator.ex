defmodule DeeplEx.LanguageValidator do
  @moduledoc """
  This module is responsible for validating the languages that are supplied.
  """

  @valid_source_languages [
    :AR,
    :BG,
    :CS,
    :DA,
    :DE,
    :EL,
    :EN,
    :ES,
    :ET,
    :FI,
    :FR,
    :HU,
    :ID,
    :IT,
    :JA,
    :KO,
    :LT,
    :LV,
    :NB,
    :NL,
    :PL,
    :PT,
    :RO,
    :RU,
    :SK,
    :SL,
    :SV,
    :TR,
    :UK,
    :ZH
  ]

  @valid_target_languages [
    :AR,
    :BG,
    :CS,
    :DA,
    :DE,
    :EL,
    :EN,
    :EN_GB,
    :EN_US,
    :ES,
    :ET,
    :FI,
    :FR,
    :HU,
    :ID,
    :IT,
    :JA,
    :KO,
    :LT,
    :LV,
    :NB,
    :NL,
    :PL,
    :PT,
    :PT_BR,
    :PT_PT,
    :RO,
    :RU,
    :SK,
    :SL,
    :SV,
    :TR,
    :UK,
    :ZH
  ]

  @doc false
  def valid_source_language?(language)
      when is_atom(language) and language in @valid_source_languages,
      do: {:valid_source_language?, true}

  @doc false
  def valid_source_language?(_), do: {:valid_source_language?, false}

  @doc false
  def valid_target_language?(language)
      when is_atom(language) and language in @valid_target_languages,
      do: {:valid_target_language?, true}

  @doc false
  def valid_target_language?(_), do: {:valid_target_language?, false}

  @doc """
  Returns a list containing the valid source languages
  """
  def valid_source_languages, do: @valid_source_languages

  @doc """
  Returns a list containing the valid target languages
  """
  def valid_target_languages, do: @valid_target_languages
end
