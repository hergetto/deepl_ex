defmodule DeeplExTest do
  use ExUnit.Case

  import Tesla.Mock

  describe "translate/4" do
    setup do
      text = "Hoje vou comer."
      translated_text = "Today I'm going to eat."
      {:ok, text: text, translated_text: translated_text}
    end

    test "translates text with source language present", %{
      text: text,
      translated_text: translated_text
    } do
      params = %{text: [text], source_lang: "PT", target_lang: "EN"}

      mock_translate_request(params, translated_text)

      assert {:ok, translation} = DeeplEx.translate(text, :PT, :EN)
      assert translation == translated_text
    end

    test "translates text with source language set to :DETECT", %{
      text: text,
      translated_text: translated_text
    } do
      params = %{text: [text], target_lang: "EN"}

      mock_translate_request(params, translated_text)

      assert {:ok, translation} = DeeplEx.translate(text, :DETECT, :EN)
      assert translation == translated_text
    end
  end

  def mock_translate_request(params, translated_text) do
    body = Jason.encode!(params)

    mock(fn
      %{method: :post, url: "https://api.deepl.com/v2/translate", body: ^body} ->
        json(%{"translations" => [%{"text" => translated_text}]})
    end)
  end
end
