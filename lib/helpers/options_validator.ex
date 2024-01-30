defmodule DeeplEx.OptionsValidator do
  @moduledoc """
  This module is responsible for validating the options for translate that are supplied.
  """

  @valid_options [
    :split_sentences,
    :preserve_formatting,
    :formality,
    :glossary_id,
    :tag_handling,
    :outline_detection,
    :non_splitting_tags,
    :splitting_tags,
    :ignore_tags
  ]

  @doc false
  def valid_options?(options) when is_map(options) do
    options_keys = Map.keys(options)

    case options_keys -- @valid_options do
      [] -> {:valid_options?, true}
      _ -> {:valid_options?, false}
    end
  end

  @doc false
  def valid_options?(_), do: {:valid_options?, false}

  @doc """
  Returns a list containing the valid options for translate
  """
  def valid_options, do: @valid_options
end
