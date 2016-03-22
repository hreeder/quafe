defmodule Quafe.Char do
  alias Quafe.API

  def character_sheet(api, characterID) do
     api
     |> API.get_authenticated("char/CharacterSheet", %{:characterID => characterID})
  end
end
