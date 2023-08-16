defmodule DeeplEx.Configuration do
  @moduledoc false
  def api_key do
    case Application.get_env(:deepl_ex, :api_key, nil) do
      nil ->
        {:error, :api_key_variable_not_set}

      api_key ->
        {:ok, api_key}
    end
  end

  def tier, do: {:ok, Application.get_env(:deepl_ex, :tier, :free)}
end
